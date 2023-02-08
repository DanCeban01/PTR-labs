defmodule Area do
def cylinder_area(radius, height) do
  2 * :math.pi * radius * (radius + height)
end
end
IO.inspect Area.cylinder_area(3, 4)
