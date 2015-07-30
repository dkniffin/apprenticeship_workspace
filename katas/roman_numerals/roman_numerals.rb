require 'pp'
require 'byebug'

class RomanNumeral
  def romanize(number)
    romanize_divmod(number)
  end

  def roman_math(equation)
    operators = ["*",'/','-','+']
    operators_re = Regexp.new(/(\*|\/|\-|\+)/)
    parts = equation.split(operators_re).map(&:strip)

    parts_dec = parts.map do |part|
      operators.include?(part) ? part : unromanize(part)
    end

    solve(parts_dec)
  end

  def solve(parts,on_mul_div_loop=true)
    return parts[0] if parts.length == 1 # Base case: Return the answer

    while parts.length != 1
      if on_mul_div_loop && (parts[1] == '/' || parts[1] == '*')
        first, op, second = parts.slice!(0,3)

        parts.unshift(operate(first,op,second))
      end
    end
    solve(parts,false)
  end

  def operate(first,op,second)
    case op
    when '*'
      first * second
    when '/'
      first / second
    when '-'
      first - second
    when '+'
      first + second
    end
  end

  def roman_map
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
  end
  def inverted_roman_map
    roman_map.invert
  end

  def unromanize(numeral)
    number = 0
    sorted_numerals = inverted_roman_map.keys.sort_by(&:length).reverse
    sorted_numerals.each do |key|
      numeral.gsub!(key) do |match|
        number += inverted_roman_map[key]
      end
    end
    number
  end

  def romanize_divmod(number)
    string = ""
    roman_map.keys.each do |divider|
      quotient,remainder = number.divmod(divider)
      string += roman_map[divider] * quotient
      number = remainder
    end
    string
  end

  def romanize_largest_key(number)
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
