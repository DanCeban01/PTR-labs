defmodule List do
def reverse_list(list) do
  Enum.reverse(list)
end
end
IO.inspect List.reverse_list([1 , 2 , 4 , 8 , 4])
