defmodule MessageActor do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, [], name: __MODULE__) # start as initial state an empty list
  end
# initiate the state
  def init(state) do
    {:ok, state}
  end
# Reply with current state
  def handle_call(_request, _from, state) do
    {:reply, state, state}
  end
# Get the input message and return result
  def handle_cast(message, state) do
    modified_message =
      case message do
        int when is_integer(int) -> int + 1
        string when is_binary(string) -> String.downcase(string)
        _ -> "I don't know how to HANDLE this!"
      end

    IO.puts("Received: #{modified_message}")
    {:noreply, modified_message}
  end
end
# Start the MessageActor
{:ok, pid} = MessageActor.start_link()

IO.inspect GenServer.call(pid, :state)

IO.inspect GenServer.cast(pid, 10)
IO.inspect GenServer.cast(pid, " Hello ")
IO.inspect GenServer.cast(pid, {10, " Hello "})
