require 'prime'
require 'net/http'

puts "First 3 prime numbers: #{Prime.first(3)}"
3.step(31, 2) do |num|
  puts "#{num} prime == #{num.prime?}"
end

puts
puts "IP Address: #{Net::HTTP.get(URI 'http://plain-text-ip.com/')}"

1.upto(10).each {|x| printf "Just another Ruby hacker,\n" }

def fib(n)
  return n unless n > 1
  fib(n-1) + fib(n-2)
end

puts fib 10
