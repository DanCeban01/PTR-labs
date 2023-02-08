defmodule Prime do
def is_prime(n) do
  if n <= 1 do
    false
  else
    !Enum.any?(2..(n-1), fn i -> rem(n, i) == 0 end)
  end
end
end
IO.inspect Prime.is_prime(44)
