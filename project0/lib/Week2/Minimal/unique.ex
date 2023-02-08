defmodule Uniq do
def sum_unique(list) do
  Enum.sum(Enum.uniq(list))
end
end
IO.inspect Uniq.sum_unique([1 , 2 , 4 , 8 , 4 , 2])
