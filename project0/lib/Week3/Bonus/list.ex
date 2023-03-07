defmodule DLList do
  def create_dllist(values) do
    first_node = spawn_link(fn -> node_loop(values, nil, nil) end)
    {:ok, first_node}
  end

  def traverse(list) do
    send(list, {:traverse, self()})
    receive do
      {:values, values} -> values
    end
  end

  def inverse(list) do
    send(list, {:inverse, self()})
    receive do
      {:values, values} -> Enum.reverse(values)
    end
  end

  defp node_loop(values, previous_node, next_node) do
    receive do
      {:traverse, requester} ->
        if next_node == nil do
          send(requester, {:values, [hd(values)]})
        else
          send(next_node, {:traverse, requester})
        end
      {:inverse, requester} ->
        if next_node == nil do
          send(requester, {:values, [hd(values)]})
        else
          send(previous_node, {:inverse, requester})
        end
      _ -> node_loop(values, previous_node, next_node)
    end
  end
end

list = DLList.create_dllist([3, 4, 5, 42])
DLList.traverse(list)
# [3, 4, 5, 42]

DLList.inverse(list)
# [42, 5, 4, 3]
