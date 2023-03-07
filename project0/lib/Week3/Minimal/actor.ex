defmodule PrinterActor do
  use GenServer
# start a new instance
  def start_link do
    GenServer.start_link(__MODULE__, [], name: __MODULE__) # Module get curent name, and an empty list is provided as initial state
  end
# Return the initial empty list and start the process
  def init([]) do
    {:ok, []}
  end
# Get the input message and return it to terminal
  def handle_cast({:print, message}, state) do
    IO.puts message
    {:noreply, state}
  end
end
# Start the PrinterActor
{:ok, pid} = PrinterActor.start_link
GenServer.cast(pid, {:print, "It's not about how much we lost. It's about how much we have left."})
