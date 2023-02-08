defmodule Rotate do
def rotate_left(list, n) do
  Enum.concat(Enum.drop(list, n), Enum.take(list, n))
end
end
IO.inspect Rotate.rotate_left([1 , 2 , 4 , 8 , 4], 3)
