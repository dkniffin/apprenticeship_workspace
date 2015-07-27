class RomanNumeral
  def romanize(number)
    romanize_largest_key(number)
  end

  def romanize_largest_key(number)
    roman_map = {
      1000 => 'M',
      900  => 'CM',
      500  => 'D',
      400  => 'CD',
      100  => 'C',
      90   => 'XC',
      50   => 'L',
      40   => 'XL',
      10   => 'X',
      9    => 'IX',
      5    => 'V',
      4    => 'IV',
      1    => 'I'
    }
    string = ""
    while number > 0
      largest_key = roman_map.keys.select {|num| num <= number }.max
      numeral = roman_map[largest_key]
      string += numeral
      number -= largest_key
    end
    string
  end

  def romanize_digits(number)
		return 'M' if number == 1000
		digits = number.to_s.chars.map(&:to_i)
		digits.reverse.each_with_index.map do |digit,i|
			digit_to_numeral(digit,i)
		end.reverse.join
	end
	def digit_to_numeral(digit,pos)
		pos_2_chars = [
			['I','V','X'],
			['X','L','C'],
			['C','D','M']
		]
		char_set = pos_2_chars[pos]

		numeral_pattern_map = [
			[],        # 0
			[0],       # 1
			[0,0],     # 2
			[0,0,0],   # 3
			[0,1],     # 4
			[1],       # 5
			[1,0],     # 6
			[1,0,0],   # 7
			[1,0,0,0], # 8
			[0,2]      # 9
		]
		numeral_pattern = numeral_pattern_map[digit]

    numeral_pattern.map {|numeral_num| char_set[numeral_num] }.join
	end
end
