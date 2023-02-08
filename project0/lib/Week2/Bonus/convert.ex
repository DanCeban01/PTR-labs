defmodule RomanNumeral do
  def convert(arabic) do
    roman_mapping = [
      {1000, "M"},
      {900, "CM"},
      {500, "D"},
      {400, "CD"},
      {100, "C"},
      {90, "XC"},
      {50, "L"},
      {40, "XL"},
      {10, "X"},
      {9, "IX"},
      {5, "V"},
      {4, "IV"},
      {1, "I"}
    ]

    result = []
    Enum.each(roman_mapping, fn {arabic_value, roman_value} ->
      while arabic >= arabic_value do
        result = [roman_value | _result]
        arabic = arabic - arabic_value
      end
    end)
    Enum.join(result)
  end
end
IO.inspect RomanNumeral.convert(13)
