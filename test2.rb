require 'base64'
require 'zlib'
require 'ascii85'
# gem install Ascii85
# Ascii85 gem also required to execute encoded scripts

@run_script = <<-'HEREDOC'
#!/usr/bin/env ruby
require 'zlib'
require 'ascii85'

s = DATA.read
s = Ascii85.decode(s)
s = Zlib::inflate(s)
eval(s)
__END__
HEREDOC

def encode_script(script_name, output)
  script_string = IO.read(script_name)
  script_string = Zlib::deflate(script_string)
  script_string = Ascii85.encode(script_string)
  IO.write(output, @run_script + script_string)
end


encode_script('example.rb', 'example.output')

