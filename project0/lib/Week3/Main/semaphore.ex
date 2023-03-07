defmodule Semaphore do
  def create_semaphore(count) do # create the semaphore with initial count = count
    {:ok, Task.async(fn -> semaphore_loop(count) end)}
  end
# loop function for tasks
  def semaphore_loop(count) do
    queue = Task.queue
    loop(count, queue)
  end
# the loop definition
  def loop(count, queue) do
    receive do
      {:acquire, task} when count > 0 ->
        new_count = count - 1
        send(task, :ok)
        loop(new_count, queue)
      {:release, _task} ->
        new_count = count + 1
        loop(new_count, queue)
      {:acquire, task} ->
        push(queue, task)
        loop(count, queue)
    end
  end
# acquire the semaphore, if it is greater than 0 return ok
  def acquire(_semaphore) do
    Task.yield({:acquire, Task.current()})
    receive do
      :ok -> :ok
    end
  end
# if it is 0 release sempahore
  def release(semaphore) do
    send(semaphore, {:release, Task.current()})
  end
end

semaphore = Semaphore.create_semaphore(0)
Semaphore.acquire(semaphore)
# This will block until a release is performed

# Critical section

Semaphore.release(semaphore)
# This will unblock one waiting acquire call
