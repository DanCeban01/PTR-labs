defmodule Fibo do
def fibonacci(n) do
  Enum.reduce(1..n, [0, 1, 2, 3], fn _, acc -> [Enum.at(acc, -1), Enum.at(acc, -2) + Enum.at(acc, -1)] end)
  |> Enum.take(n)
end
end
IO.inspect Fibo.fibonacci(3)
