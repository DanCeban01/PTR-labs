defmodule AnagramGrouping do
  def group(strings) do
    strings
    |> Enum.map(&sort_string/1)
    |> Enum.group_by(& &1)
    |> Enum.map(fn {_key, value} -> value end)
  end

  defp sort_string(string) do
    String.split(string, "")
    |> Enum.sort()
    |> Enum.join()
  end
end

IO.inspect AnagramGrouping.group([" eat " , " tea " , " tan " , " ate " , " nat " , " bat "])
