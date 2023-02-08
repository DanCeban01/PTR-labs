defmodule PhoneCombinations do
  def combinations(digits) do
    digits
    |> String.graphemes()
    |> Enum.map(&combination_for_digit/1)
    |> List.reduce(fn [head | _tail], acc -> for x <- head, y <- acc, do: [x | y]
  end)
  end

  defp combination_for_digit(digit) do
    case digit do
      "2" -> ["a", "b", "c"]
      "3" -> ["d", "e", "f"]
      "4" -> ["g", "h", "i"]
      "5" -> ["j", "k", "l"]
      "6" -> ["m", "n", "o"]
      "7" -> ["p", "q", "r", "s"]
      "8" -> ["t", "u", "v"]
      "9" -> ["w", "x", "y", "z"]
      _ -> []
    end
  end
end

IO.inspect PhoneCombinations.combinations("259")
