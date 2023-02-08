defmodule LongestCommonPrefix do
  def find(strings) do
    strings
    |> Enum.reduce(&longest_prefix/2)
  end

  def longest_prefix(string1, string2) do
    for i <- 0..min(String.length(string1), String.length(string2)) - 1, do:
      if String.at(string1, i) == String.at(string2, i), do:
        if i == String.length(string1) - 1, do  return string1 end
  else
        return String.slice("string1", 0, i)
    end
  end
IO.inspect LongestCommonPrefix.find ([" flower " ," flow " ," flight "])
