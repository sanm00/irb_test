class ParseRailsSchema
  def parse(file_path)
    @schema_info = Hash.new
    schema = File.open(file_path)

    table_name = nil

    schema.each do |line|
      puts line
      next if line[0] == '#'

      if line.include?('end')
        table_name = nil
        next
      end

      if line&.match?(/^\s*create_table.*?do \|t\|/)
        table_name = line.split(' ')[1].gsub(/"|,/, '')
        @schema_info[table_name] = {}
        flag = true
        next
      end

      if table_name
        column_info = {}

        column = line.split(' ')
        column_type = column[0].gsub('t.', '')
        column_name = column[1].gsub(/"|,/, '')

        limit_index = column.index('limit:')
        column_limt = limit_index.to_i.zero? ? nil : column[limit_index + 1].gsub(',', '')

        null_index = column.index('null:')
        column_null = null_index.to_i.zero? ? true : column[null_index + 1].gsub(',', '')
        column_null = column_null.is_a?(String) ? column_null == 'true' : column_null

        comment_index = column.index('comment:')
        column_comment = comment_index.to_i.zero? ? nil : column[comment_index + 1]..gsub(',', '')

        @schema_info[table_name][column_name] = {
          'name' => column_name,
          'type' => column_type,
          'limit' => column_limt,
          'null' => column_null,
          'comment' => column_comment
        }

        next
      end

      if line&.match?(/^\s*add_index/)
        index_info = line.split(' ')
        index_columns = index_info[2].gsub(/["\,\[\]]/, '')
        # index_name = index_info[]
      end
    end

    @schema_info
  end

end

a = ParseRailsSchema.new.parse('test_files/schema.rb')
puts a