defmodule Extract do
def random_select(list, n) do
  1..n |> Enum.map(fn _ -> Enum.random(list) end)end
end
IO.inspect Extract.random_select([1 , 2 , 4 , 8 , 4] , 1)
