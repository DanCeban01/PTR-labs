defmodule PythagoreanTriple do
  def list() do
    triples = []
    for a <- 1..20 do
      for b <- a..20 do
        c = :math.sqrt(a*a + b*b)
        if c == :math.floor(c) and c <= 20 do
          triples = [{a, b, :math.floor(c)} | _triples]
        end
      end
    end
    triples
  end
end
IO.inspect PythagoreanTriple.list()
