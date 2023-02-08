defmodule PrimeFactorization do
  def calculate(n) do
    factors = []
    while n > 1 do
      for i <- 2..n do
        if rem(n, i) == 0 do
          factors = [i | factors]
          n = n / i
          break
        end
      end
    end
    factors
  end
end
IO.inspect PrimeFactorization.calculate(13)
