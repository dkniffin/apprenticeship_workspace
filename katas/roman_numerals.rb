require 'pp'

class Converter
	def romanize(number)
		return 'M' if number == 1000
		digits = number.to_s.chars.map(&:to_i)
		digits.reverse.each_with_index.map do |digit,i|
			digit_to_numeral(digit,i)
		end.reverse.join
	end

	def digit_to_numeral(digit,pos)
		pos_2_chars = [['I','V','X'],['X','L','C'],['C','D','M']]
		char_set = pos_2_chars[pos]

		numeral_pattern_map = [[],[0],[0,0],[0,0,0],[0,1],[1],[1,0],[1,0,0],[1,0,0,0],[0,2]]
		numeral_pattern = numeral_pattern_map[digit]

    numeral_pattern.map {|numeral_num| char_set[numeral_num] }.join
	end
end
