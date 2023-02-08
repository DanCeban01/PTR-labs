defmodule Eliminate do
def eliminate_consecutive_duplicates(list) do
  list
  |> Enum.reduce([], fn x, acc ->
    if acc == [] or hd(acc) != x, do: [x | acc],
    else: acc
  end)
  |> Enum.reverse()
end
end
IO.inspect Eliminate.eliminate_consecutive_duplicates([1 , 2 , 2 , 2 , 4 , 8 , 4])
