@run_script = <<-HEREDOC
#!/usr/bin/env ruby

eval DATA.read.unpack('B*').join.scan(/.{7}/).collect{|x|'0'+x}.collect{|x|[x].pack('B*')}.join
__END__
HEREDOC

def encode_script(script_name, output)
  script_string = IO.read(script_name)
  puts script_string.length
  binary_script = script_string.split('').collect {|x| x.unpack('B*').first[1,7] }.join
  shortened_script = binary_script.scan(/.{1,8}/).collect {|x| [x].pack('B*') }
  puts IO.write(output, @run_script + shortened_script.join)
end

encode_script('test.rb', 'example.binary')

# approx before size: 664
# approx after  size: 706
# saves right at 12% with scripts of sufficient size, ie > 5000 bytes
