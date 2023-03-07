defmodule AveragerActor do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, [0, 0], name: __MODULE__) # initiate server as empty list
  end
# initiate empty list with it structure
  def init([sum, count]) do
    {:ok, [sum, count]}
  end
# take the input data and perform the calculation
  def handle_cast({:average, number}, [sum, count]) do
    new_sum = sum + number
    new_count = count + 1
    IO.puts "Current average is #{new_sum / new_count}"
    {:noreply, [new_sum, new_count]}
  end
end

{:ok, pid} = AveragerActor.start_link
# Output: "Current average is 0"

GenServer.cast(pid, {:average, 10})

GenServer.cast(pid, {:average, 50})

GenServer.cast(pid, {:average, 20})
