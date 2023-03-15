require 'mini_magick'

# 验证码字符集
# CHARSET = %w{A B C D E F G H J K L M N P Q R S T U V W X Y Z 2 3 4 5 6 7 8 9}
CHARSET = [*'1'..'9'] + [*'A'..'Z'] + [*'a'..'z'] 
# 生成验证码
def generate_captcha
  # 生成随机字符串
  captcha = (0...4).map { CHARSET[rand(CHARSET.size)] }.join

  # 创建图片对象
  image = MiniMagick::Image.open('test_files/bg_banner.png')#("xc:white", "size=120x50")

  # 添加验证码文字
  image.combine_options do |cmd|
    cmd.pointsize "36"
    cmd.resize "250x200"
    cmd.gravity 'center'
    cmd.draw "text -100,0 '#{captcha[0]}'"
  end

  image.combine_options do |cmd|
    cmd.pointsize "36"
    # cmd.resize "250x200"
    cmd.gravity 'center'

    cmd.fill '#b66fa2'
    cmd.draw "text -50,0 '#{captcha[1]}'"
  end


  image.combine_options do |cmd|
    cmd.pointsize "36"
    # cmd.resize "250x200"
    cmd.gravity 'center'

    # cmd.fill '#b66fa2'
    cmd.draw "text 0,0 '#{captcha[2]}'"
  end

  image.combine_options do |cmd|
    cmd.pointsize "36"
    # cmd.resize "250x200"
    cmd.gravity 'center'

    cmd.fill '#b66fa2'
    cmd.draw "text 50,0 '#{captcha[3]}'"
  end

  # 添加噪点
  image.combine_options do |cmd|
    cmd.implode "0.2"
  end

  # 添加干扰线
  image.combine_options do |cmd|
    # cmd.stroke "black"
    cmd.strokewidth "1"
    cmd.gravity 'center'
    cmd.stroke '#CCCCCC'
    cmd.fill 'none'
    cmd.draw "line 10,10 240,40"
    cmd.draw "line 10,40 110,10"
    cmd.draw "line 100,00 250,40"
  end

  # 返回图片对象和验证码字符串
  return image, captcha
end

# 保存验证码图片
def save_captcha(image, path)
  image.format "png"
  image.write path
end

# 生成并保存验证码图片
image, captcha = generate_captcha

# puts image.data
save_captcha(image, "test_files/from_internets.png")

# 打印验证码字符串
puts captcha


# 在上述代码中，我们首先定义了一个字符集，用于生成验证码字符串。然后，我们定义了一个 generate_captcha 方法，用于生成验证码。该方法首先生成随机字符串，然后创建一个白色背景的图片对象，使用 combine_options 方法添加验证码文字、噪点和干扰线。最后，该方法返回图片对象和验证码字符串。

# 接着，我们定义了一个 save_captcha 方法，用于保存验证码图片。该方法将图片对象的格式设置为 PNG，并将其保存到指定路径。

# 最后，我们调用 generate_captcha 方法生成验证码，并将生成的验证码图片保存到文件系统中。我们还打印了验证码字符串，以供验证使用。