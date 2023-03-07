defmodule ActorOne do
  def start_link(actor_two_pid) do
    spawn_link(__MODULE__, :loop, [actor_two_pid]) # start as initial state an empty list
  end
# looks for actor 2 status and respond when it stop
  def loop(actor_two_pid) do
    receive do
      {:EXIT, actor_two_pid, _reason} ->
        IO.puts("Actor Two stopped!")
    end
    loop(actor_two_pid)
  end
end

defmodule ActorTwo do
  def start_link do
    spawn_link(__MODULE__, :loop, []) # start the function with empty list as initial state
  end
# give to terminal result of running
  def loop do
    IO.puts("Actor Two is running")
    Process.sleep(1000)
    loop()
  end
end

# Driver code
actor_two_pid = ActorTwo.start_link()
actor_one_pid = ActorOne.start_link(actor_two_pid)

# Wait for a while to see the monitoring in action
Process.sleep(6000)
Process.exit(actor_two_pid, :normal)
Process.sleep(6000)
