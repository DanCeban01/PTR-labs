defmodule QueueActor do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, [], name: __MODULE__) # initiate the starting state as empty list
  end
# intiate the list
  def init([]) do
    {:ok, []}
  end
# take the input data
  def handle_cast({:push, item}, state) do
    {:noreply, [item | state]}
  end
# takes the list and remove the first item if it is not empty
  def handle_call(:pop, _from, [head | tail]) do
    {:reply, head, tail}
  end
# if it is empty return it
  def handle_call(:pop, _from, []) do
    {:reply, :empty, []}
  end
end
# init the Queue with input data
defmodule Queue do
  def new_queue do
    {:ok, pid} = QueueActor.start_link
    pid
  end
# send message to cast
  def push(pid, item) do
    GenServer.cast(pid, {:push, item})
    :ok
  end
# send message to call
  def pop(pid) do
    GenServer.call(pid, :pop)
  end
end


pid = Queue.new_queue
Queue.push(pid, 42)
# Output: :ok

IO. inspect Queue.pop(pid)
# Output: 42
