class Kata
  def romanize(number)
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
end
