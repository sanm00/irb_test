require "rexml/document"
file = File.new( "mydoc.xml", 'r')
doc = REXML::Document.new file
doc.root.elements.each do |m|
  puts m.elements['Name']
end
# string = <<EOF
#   <mydoc>
#     <someelement attribute="nanoo">Text, text, text</someelement>
#   </mydoc>
# EOF
# doc = REXML::Document.new string

# File.open("mydoc.xml","w") do |f|
#   f.write(doc)
# end
