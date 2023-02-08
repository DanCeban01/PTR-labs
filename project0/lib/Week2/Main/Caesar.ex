defmodule Caesar do
  @alphabet "abcdefghijklmnopqrstuvwxyz"

  def encode(str, shift) do
    str
    |> String.downcase()
    |> String.graphemes()
    |> Enum.map(fn char ->
      if char in @alphabet do shift_char(char, shift),
      else : char
    end)
    |> Enum.join()
  end

  def decode(str, shift) do
    encode(str, -shift)
  end

  def shift_char(char, shift) do
    index = String.index(@alphabet, char)
    new_index = rem((index + shift), 26)
    @alphabet |> String.graphemes() |> Enum.at(new_index)
  end
end
IO.inspect Caesar.encode(["Love"], 17)
