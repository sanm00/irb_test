require 'yaml'

$i18n_json = nil
# 获取文件夹下所有文件路径
def _ls(root_path, paths = [])  
  if File.file? root_path
    paths << root_path if root_path.end_with?('.rb')
    return paths
  end

  Dir.glob("#{root_path}/*").each do |rp|
    if File.file? rp
      paths << rp
    else
      send(__method__, rp, paths)
    end
  end

  paths
end

def scan(file_path, greps)
  secan_rtn = []

  File.foreach(file_path).with_index do |line, index|
    grep_rtn = greps.map { |grep| line.match?(grep) }
    next unless grep_rtn.reduce(&:|)

    ling_info = { ling_index: index + 1, o_line: line }
    
    i18n_strs = parse_i18n(line)

    i18n_strs.each do |s|
      cn = _t(s.gsub(/'|"/, ''))
      # ling_info[:i18n] = "I18n.t(#{s})"
      # ling_info[:cn] = cn

      secan_rtn << { i18n: "I18n.t(#{s})", cn: cn }.merge(ling_info)
    end
  end

  secan_rtn
end

def parse_i18n(text)
  text.scan(/I18n\.t\(([^\)]*)\)/).flatten
end

# 得到对应的中文
def _t(tk)
  $i18n_json.dig(*tk.split('.'))
end

def parse_i18n_yaml(file_path)
  $i18n_json = YAML.load(File.open(file_path))['zh-CN']
end

# 拼装正则
def greps
  # create|create!|update|where|find_by|find_by_
  grep1 = /\.(create\(|create!\(|where\(|find_by\(|update\(|find_by_).*?: I18n\.t/
  # == | !=
  grep2 = /(==|!=) I18n\.t/
  #_update
  grep3 = /(_update\().*I18n\.t/
  # != ?
  grep4 = /(!= ?).*I18n\.t/
  # << 
  grep5 = /(==).*?(<<) I18n\.t/
  # %w 
  # rgep6 = /(%(W|w)(\[|\()I18n\.t)/

  # create_
  grep5 = /(create_).*?(\().*?: I18n\.t/ 

  # ^(\s*)(\s|%b|%th|%p) [\u4e00-\u9fa5]+$ 全中文

  # (\.(gsub|gsub!|split)\(I18n\.t) 作为分隔符

  [grep1,grep2,grep3,grep4,grep5]
end

def write_scan_rtn(source_file_path = nil, con = [], text = nil)
  # puts "写结果：#{con}"
  File.open("#{Dir.pwd}/scan_file.txt", "a") do |file|
    file.puts source_file_path if source_file_path

    con.each do |c|
      file.puts "\n"
      file.puts c[:o_line].gsub(/^\s*/, '')
      file.puts "#{c[:ling_index]}: #{c[:i18n]}  #{c[:cn]}"
    end unless con.nil?

    file.puts "\n"

    file.puts text if text
  end
end

def main
  # 国际化文件路径
  i18n_yaml_path = '/Users/sanm/Works/git/gitee/config/locales/backend2.zh-CN.yml'
  # 根目录
  root_path = '/Users/sanm/Works/git/gitee/'

  scan_file_count = 0
  entry_count = 0
  hit_file_count = 0

  # 需要扫描的文件夹的相对路径集合
  need_scan_dirs = [
    'app/workers',
    'app/observers',
    'app/models',
    'app/services',
    'app/controllers',
    'app/graphql',
    'app/helpers',
    'app/api'
    # 'app/services/gitee_scans_service.rb'
  ]

  # 解析国际化文件
  parse_i18n_yaml(i18n_yaml_path)

  # 扫描文件
  puts "开始扫描"
  need_scan_dirs.each do |dir_path|
    file_pathes = _ls("#{root_path}#{dir_path}")
    scan_file_count += file_pathes.size
    puts "开始扫描#{dir_path}..."
    # 解析文件
    file_pathes.each do |file_path|
      rtn = scan(file_path, greps)
      entry_count += rtn.size
      hit_file_count += 1 if rtn.size > 0 
      write_scan_rtn(file_path.gsub(root_path, ''), rtn) unless rtn.nil? || rtn.empty?
    end

    puts "#{dir_path}扫描结束"
  end

  write_scan_rtn(nil, nil, "共扫描#{scan_file_count}个文件，命中#{hit_file_count}个文件，#{entry_count}个词条")
  puts "扫描结束"
end

main()
# puts _ls(Dir.pwd())

# parse_i18n_yaml('/Users/sanm/Works/git/gitee/config/locales/backend2.zh-CN.yml')
# puts scan("/Users/sanm/Works/git/gitee/app/services/gitee_scans_service.rb", greps)