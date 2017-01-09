require 'base64'
require 'zlib'

@run_script = <<-HEREDOC
#!/usr/bin/env ruby
require 'base64'
require 'zlib'
s = DATA.read
s = Base64.decode64(s)
s = Zlib::inflate(s)
eval(s)
__END__
HEREDOC

def encode_script(script_name, output)
  script_string = IO.read(script_name)
  script_string = Zlib::deflate(script_string)
  script_string = Base64.strict_encode64(script_string)
  IO.write(output, @run_script + script_string)
end


encode_script('example.rb', 'example.output')

