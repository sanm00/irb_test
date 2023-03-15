require 'net/http'
require 'uri'
require 'json'
require 'tempfile'

API_KEY = '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'

class String
  def blue
    return "\033[34m #{self}\033[0m"
  end
  def red
    return "\033[31m #{self}\033[0m"
  end
  def green
    return "\033[32m #{self}\033[0m"
  end
  def yellow
    return "\033[33m #{self}\033[0m"
  end
  def magenta
    return "\033[35m #{self}\033[0m"
  end
  def cyan
    return "\033[36m #{self}\033[0m"
  end
end


def completion(content)
  params = {"model": 'gpt-3.5-turbo', messages: [{role: 'user', content: content}]}
  rtn = post('https://api.openai.com/v1/chat/completions', params)
  rtn['choices'].first&.[]('message')&.[]('content')
end

def get(url, params = {})
  query = params.map{ |key, value| "#{key}=#{value}" }.join('&')
  url = query.empty? ? url : "#{url}?#{query}"
  url = URI(url)
  
  https = Net::HTTP.new(url.host, url.port)
  https.use_ssl = true
  request = Net::HTTP::Get.new(url)
  request["Authorization"] = "Bearer #{API_KEY}"
  res = https.request(request)
  JSON.parse res.body
end

def post(url, params = {})
  url = URI(url)
  headers = { 'Authorization': "Bearer #{API_KEY}", 'content-type': 'application/json', 'OpenAI-Organization': 'org-zNNvgRBtcptGMikZoJpaETNK' }
  res = Net::HTTP.post(url, params.to_json, headers)
  JSON.parse res.body
end

def my_puts(content)
  content.each_char do |c|
    print c
    $stdout.flush
    sleep 0.05
  end
end

def open_by_vim(content)
  check_toolchain_installed('vim')

  system("vim #{new_tempfile(content)}")
end

def open_by_vscode(content)
  check_toolchain_installed('code')

  vscode = IO.popen('code -', 'w')
  vscode.puts content
  vscode.close_write
end

def open_by_mdcat(content)
  check_toolchain_installed('mdcat')

  system("mdcat #{new_tempfile(content)}")
end


def new_tempfile(content)
  # 创建一个临时文件
  temp_file = Tempfile.new('chatgpt_message.md', './test_files')

  # 写入字符串到文件
  temp_file.write(content)
  temp_file.close
  temp_file.path
end

# 检查依赖工具是否有安装
def check_toolchain_installed(toolchain)
  system("#{toolchain} --version > /dev/null 2>&1")
  return true if $?.success?

  puts "#{toolchain} 未安装".red
  puts "请执行 brew install #{toolchain} 来安装 #{toolchain}"
  puts "\n"
  exit
end

# pandoc https://pandoc.org/installing.html
def message

  [{"message"=>
  {"role"=>"assistant",
   "content"=>
    "\n" +
    "\n" +
    "要生成一个图形验证码，您可以使用 Ruby 和 RubyGems 上的代码库。\n" +
    "\n" +
    "1.安装 gem 包\n" +
    "\n" +
    "首先，您需要安装以下 gem 包：\n" +
    "\n" +
    "* RMagick - Ruby 的图像处理库\n" +
    "* Captcha - 用于生成验证码的库\n" +
    "\n" +
    "运行以下命令来安装它们：\n" +
    "\n" +
    "```\n" +
    "gem install rmagick\n" +
    "gem install captcha\n" +
    "```\n" +
    "\n" +
    "2.编写生成验证码的代码\n" +
    "\n" +
    "接下来，您可以编写 Ruby 代码来生成验证码。以下是一个示例代码：\n" +
    "\n" +
    "```ruby\n" +
    "require 'rubygems'\n" +
    "require 'RMagick'\n" +
    "require 'captcha'\n" +
    "\n" +
    "# 生成验证码\n" +
    "captcha = Captcha::Image.new(:width => 100, :height => 30)\n" +
    "code = captcha.generate\n" +
    "\n" +
    "# 显示验证码图片\n" +
    "image = Magick::Image.new(100, 30)\n" +
    "gc = Magick::Draw.new\n" +
    "gc.fill = \"white\"\n" +
    "gc.rectangle(0, 0, 100, 30)\n" +
    "gc.annotate(image, 0, 0, 0, 0, code) do\n" +
    "  self.font_family = 'Arial'\n" +
    "  self.fill = 'black'\n" +
    "  self.gravity = Magick::CenterGravity\n" +
    "end\n" +
    "gc.draw(image)\n" +
    "image.write('captcha.jpg')\n" +
    "```\n" +
    "\n" +
    "首先，我们使用 `Captcha::Image` 类来生成验证码。我们指定宽度和高度作为参数。这将返回一个包含验证码文本和图像的哈希对象。\n" +
    "\n" +
    "然后，我们使用 `RMagick` 库创建一个新的图像，并用白色填充它。接下来，我们使用 `Magick::Draw` 类来设置字体、颜色和位置，并使用 `annotate` 方法将验证码文本添加到图像中。最后，我们使用 `write` 方法将图像保存为 JPEG 文件。\n" +
    "\n" +
    "3.运行代码\n" +
    "\n" +
    "运行代码，将会在您的工作目录中生成一个名为「captcha.jpg」的验证码图像。\n" +
    "\n" +
    "```\n" +
    "ruby captcha.rb\n" +
    "```\n" +
    "\n" +
    "这个示例只是生成图片验证码的一个基本例子，您可以根据自己的需要和兴趣进行修改和调整来适应您的应用场景。"},
 "finish_reason"=>"stop",
 "index"=>0}]
end
# ARGV[0]
# open_by_mdcat message.first['message']['content']



