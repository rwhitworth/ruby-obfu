require 'base64'
require 'zlib'

def run_script(script_name)
  script_string = IO.read(script_name)
  script_string = Base64.decode64(script_string)
  script_string = Zlib::inflate(script_string)
  eval(script_string)
end

def encode_script(script_name, output)
  script_string = IO.read(script_name)
  script_string = Zlib::deflate(script_string)
  script_string = Base64.encode64(script_string)
  IO.write(output, script_string)
end


encode_script('example.rb', 'example.output')

run_script('example.output')
