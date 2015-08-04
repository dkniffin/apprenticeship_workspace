#!/usr/sbin/ruby
require 'benchmark'
require_relative 'roman_numerals'

puts "Benchmarking romanize"
[1,99,449,949,1000].each do |number|
  puts "number: #{number}"
  Benchmark.bm do |x|
    x.report { RomanNumeral.romanize_divmod(number) }
    x.report { RomanNumeral.romanize_largest_key(number) }
    x.report { RomanNumeral.romanize_digits(number) }
  end
end
