require 'prime'
require 'net/http'

puts "First 3 prime numbers: #{Prime.first(3)}"
3.step(31, 2) do |num|
  puts "#{num} prime == #{num.prime?}"
end

puts

puts "IP Address: #{Net::HTTP.get(URI 'http://plain-text-ip.com/')}"
