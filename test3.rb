require 'zlib'

@run_script = <<-HEREDOC
#!/usr/bin/env ruby
require 'zlib'
eval Zlib::inflate DATA.read
__END__
HEREDOC

def encode_script(script_name, output)
  script_string = IO.read(script_name)
  script_string = Zlib::deflate(script_string, 9)
  IO.write(output, @run_script + script_string)
end

encode_script('example.rb', 'example.binary')
