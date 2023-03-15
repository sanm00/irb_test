# excel 导出依赖 gem 'caxlsx'
# gem install 'caxlsx'

require 'axlsx'

class PaseStructSql
  attr_reader :parse_path, :save_path
  attr_accessor :tables

  def initialize(parse_path, save_path)
    @parse_path = parse_path
    @save_path = save_path
    @tables = {}
  end

  def parse
    structure = File.open(parse_path)

    table_name = nil

    structure.each do |line|
      # next if line.match?(/^\s*--|\s*\/*!/)
      next if line.start_with?('--') || line.start_with?('/*!')

      if line.match?(/^\s*CREATE TABLE/)
        table_name = line.split(' ')[2].gsub('`', '')
        @tables[table_name] ||= {}
        next
      end

      next if line.match?(/^\s*PRIMARY KEY/)

      # 唯一索引
      if line.match?(/^\s*UNIQUE KEY/)
        unique_index = line.split(' ')
        indexname = unique_index[2].gsub('`', '')
        columns = unique_index[3].gsub(/\(|\),|\)|`/, '')

        indexdef = "CREATE UNIQUE INDEX #{indexname} ON public.#{table_name} USING btree (#{columns})"
        @tables[table_name]['index'] ||= []
        
        @tables[table_name]['index'] << {
          'indexname' => indexname,
          'indexdef'  => indexdef
        }

        next
      end

      # 普通索引
      if line.match?(/^\s*KEY/)
        index = line.split(' ')
        indexname = index[1].gsub('`', '')
        columns = index[2].gsub(/\(|\),|\)|`/, '')

        indexdef = "CREATE INDEX #{indexname} ON public.#{table_name} USING btree (#{columns})"
        @tables[table_name]['index'] ||= []

        @tables[table_name]['index'] << {
          'indexname' => indexname,
          'indexdef'  => indexdef
        }

        next
      end

      # 一张表的结束符
      if line.match?(/^\s*\)\s/)
        table_name = nil
        next
      end

      if table_name
        column = line.split(' ')

        column_name = column[0].gsub('`', '')
        column_type = type(column[1])
        comment_index = column.index('COMMENT')

        if comment_index.nil?
          column_comment = 'null'
        else
          column_comment = column[comment_index.to_i + 1]&.gsub(/'|,/, '')
        end

        @tables[table_name]['columns'] ||= []

        @tables[table_name]['columns'] << {
          'name' => column_name,
          'type' => column_type,
          'comment' => column_comment
        }
      end
    end

    nil
    # @tables
  end

  def type(type_str)
    if type_str.include?('int')
      'Integer'
    elsif type_str.include?('varchar')
      'String'
    elsif type_str.include?('datetime')
      'Datetime'
    elsif type_str.include?('text')
      'Text'
    else
      type_str
    end
  end

  def export(table_name = nil)
    return 'tables is empty' if tables.empty?

    puts "正在导出..."

    _tables = table_name.nil? ? tables : { table_name => tables[table_name]}

    p = Axlsx::Package.new
    wb = p.workbook
    s = wb.styles
    header = s.add_style bg_color: 'DD', sz: 11, b: true, alignment: { horizontal: :center }
    table_name_style = s.add_style sz: 11, b: true

    _tables.each do |_table_name, colums|
      puts _table_name

      wb.add_worksheet(name: _table_name.slice(0, 30)) do |sheet|
        # 表名
        sheet.add_row ['table_name:', _table_name, nil], style: table_name_style
        sheet.add_row

        sheet.add_row ['description:', nil, nil], style: table_name_style, offset: 1
        sheet.add_row

        sheet.add_row ['column', 'data_type', 'descript'], style: header, offset: 1

        colums['columns'].each do |col|
          sheet.add_row col.values
        end

        sheet.add_row

        sheet.add_row ['indexname', 'indexdef'], style: header, offset: 1

        unless colums['index'].nil?
          colums['index'].each do |item|
            sheet.add_row item.values
          end
        end

        sheet.merge_cells('B1:C1')
        sheet.merge_cells('B3:C3')
      end

      p.serialize save_path
    end
    
    puts "导出结束"
  end

  def statistics
    table_count = @tables.size
    st = {}
    @tables.each do |name, info|
      st[name] = info['index'].nil? ? 0 : info['index'].count
    end

    [table_count, st]
  end
end

# 检查依赖

begin
  gem 'caxlsx'
resuce Gem::MissingSpecError
  # excel 导出依赖 gem 'caxlsx'
  # gem install 'caxlsx'
  puts "excel 导出依赖 gem 'caxlsx'"
  puts "执行 gem install 'caxlsx' 安装"
end

if ARGV[0].nil? || ARGV[1].nil?
  puts '请填写解析文件路径, 导出文件存储路径：ruby parse_struct_sql.rb <解析文件路径> <导出文件存储路径>'
  exit
end

puts "parse_file_path: #{ARGV[0]}"
puts "save_file_path: #{ARGV[1]}"
puts "\n"

a = PaseStructSql.new(ARGV[0], ARGV[1])
a.parse
# puts a.tables
a.export
st = a.statistics.last
# puts st

# st.keys.each do |s|
#   puts s
# end