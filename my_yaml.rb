require 'yaml'
require 'json'
class MyYaml
  class << self
    @@text = ''
    @@offset_map = {}

    def read(file_path = nil)
      file_path ||= './yaml_text.yml'
      YAML.load(File.open(file_path))
    end 

    def write(file_path = nil, data = nil)
      data = test_data
      file_path ||= './yaml_text.yml'
      File.open(file_path,"w") do |f|
        YAML.dump(data, f)
      end
    end

    def my_read
      data = {}
      file_path ||= './yaml_text.yml'
      File.open(file_path) do |text|
        text.each do |line|
          key, value = line.split(':')

        end
      end
    end

    def to_text(data=nil, parent_key = '0', deep = 0)
      @@offset_map[parent_key] = @@offset_map[parent_key] ? @@offset_map[parent_key] : deep
      return unless data.is_a?(Hash)
      data.each do |key, value|
        deep = @@offset_map[key] ? @@offset_map[key] : @@offset_map[parent_key] + 1

        if value.is_a?(Hash)
          space_s = '  ' * deep
          @@text += "#{space_s}#{key}:\n"
          send(__method__, value, key, deep)
        else
          space_s = '  ' * deep
          @@text += "#{space_s}#{key}: #{value}\n"
        end
      end

      @@text
    end

    def puts_offset_map
      puts @@offset_map
    end
  
    def test_data
      data = {
        a: 'a',
        b: {
          b1: 'b1',
          b2: {
            bb1: 'bb1',
            bb2: {
              bbb1: {
                bbbb1: 'bbbb1'
              },
              bbbb2: 'bbbb2'
            }
          },
          b3: 'b3'
        },
        c: 'c',
        d: {
          d1: 1,
          d2: 2
        },
        e: {
          e1: {
            e3: {
              e4: {
                e5: 5
              }
            }
          },
          e2: 2
        },
        f: {
          f1: 1
        },
        g: 2
      }

      # puts JSON.pretty_generate(data)
      data 
    end

  end
end