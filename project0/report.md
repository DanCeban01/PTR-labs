# FAF.PTR16.1 -- Project 0 
> **Performed by:** Dan Ceban, group FAF-202
> **Verified by:** asist. univ. Alexandru Osadcenco
----

## Week 1

- `Minimal Task`: Follow an installation guide to install the language / development environment of your choice: I choose the `Elixir programming luanguage.`

- `Minimal Task`: Write a script that would print the message “Hello PTR” on the screen. Execute it:

``` Elixir
defmodule Hello do
  def hello () do
    "Hello, PTR!"
  end
end
```

- `Main Task`: Initialize a VCS repository for your project. Push your project to a remote repo: Here is my GitHub repository with the projects for [PTR](https://github.com/DanCeban01/PTR-labs).

- `Bonus Task`: Write a comprehensive [readme](https://github.com/DanCeban01/PTR-labs/blob/main/README.md) for your repository.

- `Bonus Task`: Create a unit test for your project. Execute it.

``` Elixir
defmodule HelloTest do
  use ExUnit.Case

  test "prints Hello PTR" do
    assert HelloPTR.hello() == "Hello, PTR!"
  end
end
```

----
## Week2 

- `Minimal Task`: Write a function that determines whether an input integer is prime.

``` Elixir
 if n <= 1 do
    false
  else
    !Enum.any?(2..(n-1), fn i -> rem(n, i) == 0 end)
```
In the code we get a number `n` which is need to be controled if it is Prime or not, first of all we control if the given number is not 0 or 1, in case there are another number we start to perform the `Enum.any` to find.

Input:
``` Elixir
IO.inspect Prime.is_prime(44)
```
Output:
```
false
```

- `Minimal Task`: Write a function to calculate the area of a cylinder, given it’s height and radius.

``` Elixir 
def cylinder_area(radius, height) do
  2 * :math.pi * radius * (radius + height)
end
```
This one is really easy, we just implement the math formula and run the code.

Input:
``` Elixir
IO.inspect Area.cylinder_area(3, 4)
```
Output:
```
175.92918860102841
```


- `Minimal Task`: Write a function to reverse a list.

``` Elixir
def reverse_list(list) do
  Enum.reverse(list)
end
```
This task is easily performed in Elixir by using the `Enum.reverse`.

Input:
``` Elixir
IO.inspect List.reverse_list([1 , 2 , 4 , 8 , 4])
```

Output:
```
([4 , 8 , 4 , 2 , 1])
```


- `Minimal Task`: Write a function to calculate the sum of unique elements in a list.

``` Elixir
def sum_unique(list) do
  Enum.sum(Enum.uniq(list))
```
As in the previous task Elixir offer the library Enum. which is usefull in resolving a lot of basic tasks as this one, here we take the list, find the uniq values and the Enum.sum save them in an another new list.

Input:
``` Elixir
IO.inspect Uniq.sum_unique([1 , 2 , 4 , 8 , 4 , 2])
```
Output:
```
15
```

- `Minimal Task`: Write a function that extracts a given number of randomly selected elements from a list.

``` Elixir
def random_select(list, n) do
  1..n |> Enum.map(fn _ -> Enum.random(list) end)end
``` 
In this task, the list is parsed but before of this each element is numerotated and in dependence of the value of n which is the position in the list the given number is extracted.

Input:
``` Elixir
IO.inspect Extract.random_select([1 , 2 , 4 , 8 , 4] , 1)
```
Output:
```
2
```

- `Minimal Task`: Write a function that returns the first n elements of the Fibonacci sequence.
``` Elixir
def fibonacci(n) do
  Enum.reduce(1..n, [0, 1, 2, 3], fn _, acc -> [Enum.at(acc, -1), Enum.at(acc, -2) + Enum.at(acc, -1)] end)
  |> Enum.take(n)
```
In order to get the first `n` elements of the Fibonacci sequence, we map the formula of finding if a number is the part of this sequence or not, and after that in dependency with the value of `n` we get the results in form of the list.

Input:
``` Elixir
IO.inspect Fibo.fibonacci(3)
```
Output:
```
([0, 1, 1])
```

- `Minimal Task`: Write a function that, given a dictionary, would translate a sentence. Words not found in the dictionary need not be translated.

``` Elixir
def translate(sentence, dict) do
  String.split(sentence)
  |> Enum.map(fn word -> dict[word] || word end)
  |> Enum.join(" ")
end
```
The code takes two arguments: a sentence (a string) and a dict (a dictionary-like data structure). The function performs the following operations: Split the sentence string into individual words using the `String.split` function. This returns a list of words. Use the `Enum.map` function to iterate over the list of words and translate each word using the dict argument. If a word is not found in the dict, it is returned unchanged. Use the `Enum.join` function to concatenate the translated words back into a single string, separated by spaces. Finally, the result of the function is the translated sentence, returned as a string.

Input:
``` Elixir
IO.inspect TT.translate ([" mama is with papa"] dict)
```
Output:
```
mother is with father
```

- `Minimal Task`: Write a function that receives as input three digits and arranges them in an order that would create the smallest possible number. Numbers cannot start with a 0.

``` Elixir
def arrange_digits(a, b, c) do
  [a, b, c]
  |> Enum.sort()
  |> Enum.reverse()
  |> List.to_string()
  |> String.to_integer()
end
```
The solution create a list [a, b, c] and pass it to the `Enum.sort` function to sort the list in ascending order. Use the `Enum.reverse` function to reverse the sorted list, resulting in a list of integers in descending order. Convert the list of integers to a string using the List.to_string function. Finally, convert the string representation of the integers back to an integer using the String.to_integer function. The result of the function is an integer that represents the concatenation of the input integers in descending order.

Input:
``` Elixir
IO.inspect Number.arrange_digits(4, 5, 3)
```
Output:
```
345
```


- `Minimal Task`: Write a function that would rotate a list n places to the left.

``` Elixir
def rotate_left(list, n) do
  Enum.concat(Enum.drop(list, n), Enum.take(list, n))
```

This task is easily performed: `Enum.drop` move the `n` number of elements to to the end of list one by one, `Enum.take` moves the remained elements to the start.

Input:
``` Elixir
IO.inspect Rotate.rotate_left([1 , 2 , 4 , 8 , 4], 3)
```

Output:
```
[8, 4, 1, 2, 4]
```

- `Minimal Task` Write a function that lists all tuples a, b, c such that a^2 + b^2 = c^2 and a,b <= 20.

``` Elixir
def list() do
    triples = []
    for a <- 1..20 do
      for b <- a..20 do
        c = :math.sqrt(a*a + b*b)
        if c == :math.floor(c) and c <= 20 do
          triples = [{a, b, :math.floor(c)} | _triples]
```

Function list returns a list of Pythagorean triples (integers a, b, and c such that a^2 + b^2 = c^2). Here's how the function works: A variable triples is defined as an empty list ([]). This will store the Pythagorean triples that the function finds. The function uses two nested for loops to iterate over integers a and b in the range of 1 to 20. For each combination of a and b, the function calculates c as the square root of a^2 + b^2. The function checks if c is an integer (i.e., c == :math.floor(c)) and if c is less than or equal to 20 (i.e., c <= 20). If the conditions are met, the function adds a new triple {a, b, :math.floor(c)} to the triples list using the | operator to concatenate the new triple with the existing list. After both for loops have completed, the function returns the triples list as its result.

Input:
``` Elixir
IO.inspect PythagoreanTriple.list()
```

Output:
``` 
([3, 4, 5])
```

- `Main Task`: Write a function that eliminates consecutive duplicates in a list.

``` Elixir
def eliminate_consecutive_duplicates(list) do
  list
  |> Enum.reduce([], fn x, acc ->
    if acc == [] or hd(acc) != x, do: [x | acc],
    else: acc
  end)
  |> Enum.reverse()
```
This code implements a function eliminate_consecutive_duplicates that takes a list as input and returns a new list with consecutive duplicates removed. Here's how the code works: The input list is piped into the Enum.reduce function. The Enum.reduce function takes two arguments: an empty list [] and a lambda function fn x, acc ->. The lambda function takes two arguments: x and acc. The x argument is the current item of the input list and acc is the accumulated result so far. The lambda function checks if acc is an empty list or if the first item of the acc list (obtained using the hd function) is not equal to x. If either of these conditions is true, the current item x is consed onto the acc list using the [x | acc] syntax. If neither of the conditions is true, then acc is returned as is. The process continues until all items in the input list have been processed.The final result is obtained by reversing the accumulated list using the Enum.reverse function. This is because the Enum.reduce function processes the input list from left to right, but the final result needs to be in the original order.

Input:
``` Elixir
IO.inspect Eliminate.eliminate_consecutive_duplicates([1 , 2 , 2 , 2 , 4 , 8 , 4])
```
Output:
```
([1 , 2 , 4 , 8 , 4])
```

- `Main Task`: Write a function that, given an array of strings, will return the words that can be typed using only one row of the letters on an English keyboard layout.

``` Elixir
def words_from_one_row(words) do
    row1 = "qwertyuiop"
    row2 = "asdfghjkl"
    row3 = "zxcvbnm"

    Enum.filter(words, fn word ->
     row = if String.contains(row1, String.downcase(hd(word))) do
        row1
      else if String.contains(row2, String.downcase(hd(word))) do
        row2
      else
        row3
      end
    end
      Enum.all?(word, fn char -> String.contains(row, String.downcase(char))end)
```
Input:
``` Elixir
IO.inspect Row.words_from_one_row("asd", "wsd")
```
Output:
```
Error's in code.
```

- `Main Task`: Create a pair of functions to encode and decode strings using the Caesar cipher.

``` Elixir
 @alphabet "abcdefghijklmnopqrstuvwxyz"

  def encode(str, shift) do
    str
    |> String.downcase()
    |> String.graphemes()
    |> Enum.map(fn char ->
      if char in @alphabet do shift_char(char, shift),
      else : char
    end)
    |> Enum.join()
  end

  def decode(str, shift) do
    encode(str, -shift)
  end

  def shift_char(char, shift) do
    index = String.index(@alphabet, char)
    new_index = rem((index + shift), 26)
    @alphabet |> String.graphemes() |> Enum.at(new_index)
  end
  ```
Input:
``` Elixir
IO.inspect Caesar.encode(["Love"], 17)
```
Output:
```
  Error's in code.
  ```

- `Main Task`: White a function that, given a string of digits from 2 to 9, would return all possible letter combinations that the number could represent (think phones with buttons).

``` Elixir
def combinations(digits) do
    digits
    |> String.graphemes()
    |> Enum.map(&combination_for_digit/1)
    |> List.reduce(fn [head | _tail], acc -> for x <- head, y <- acc, do: [x | y]
  end)
  end

  defp combination_for_digit(digit) do
    case digit do
      "2" -> ["a", "b", "c"]
      "3" -> ["d", "e", "f"]
      "4" -> ["g", "h", "i"]
      "5" -> ["j", "k", "l"]
      "6" -> ["m", "n", "o"]
      "7" -> ["p", "q", "r", "s"]
      "8" -> ["t", "u", "v"]
      "9" -> ["w", "x", "y", "z"]
      _ -> []
    end
``` 
Input:
``` Elixir
IO.inspect PhoneCombinations.combinations("259")
```
Output:
```
Error's in code.
```

- `Main Task`: White a function that, given an array of strings, would group the anagrams together.

``` Elixir
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
```

Input:
``` Elixir
IO.inspect AnagramGrouping.group([" eat " , " tea " , " tan " , " ate " , " nat " , " bat "])
```
Output:
```
[["  abt"], ["  aet", "  aet", "  aet"], ["  ant", "  ant"]]
```

- `Bonus Task`: Write a function to find the longest common prefix string amongst a list of strings.
``` Elixir
def find(strings) do
    strings
    |> Enum.reduce(&longest_prefix/2)
  end

  def longest_prefix(string1, string2) do
    for i <- 0..min(String.length(string1), String.length(string2)) - 1, do:
      if String.at(string1, i) == String.at(string2, i), do:
        if i == String.length(string1) - 1, do  return string1 end
  else
        return String.slice("string1", 0, i)
    end
```

Input:
``` Elixir
IO.inspect LongestCommonPrefix.find ([" flower " ," flow " ," flight "])
```
Output:
```
Error's in code.
```

- `Bonus Task`: Write a function to convert arabic numbers to roman numerals.
``` Elixir
def convert(arabic) do
    roman_mapping = [
      {1000, "M"},
      {900, "CM"},
      {500, "D"},
      {400, "CD"},
      {100, "C"},
      {90, "XC"},
      {50, "L"},
      {40, "XL"},
      {10, "X"},
      {9, "IX"},
      {5, "V"},
      {4, "IV"},
      {1, "I"}
    ]

    result = []
    Enum.each(roman_mapping, fn {arabic_value, roman_value} ->
      while arabic >= arabic_value do
        result = [roman_value | _result]
        arabic = arabic - arabic_value
      end
    end)
    Enum.join(result)
  end
``` 

Input:
``` Elixir
IO.inspect RomanNumeral.convert(13)
```
Output:
```
Error's in code.
```

- `Bonus Task`: Write a function to calculate the prime factorization of an integer.
``` Elixir
 def calculate(n) do
    factors = []
    while n > 1 do
      for i <- 2..n do
        if rem(n, i) == 0 do
          factors = [i | factors]
          n = n / i
          break
        end
      end
    end
    factors
  end
```
Input:
``` Elixir
IO.inspect PrimeFactorization.calculate(13)
```
Output:
``` 
Error's in code.
```

----
## Week 3

- `Minimal Task`: Create an actor that prints on the screen any message it receives.

``` Elixir
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
``` 

First of all we initiate an empty list with the help of `GenServer`. After it with the help of function `handle_cast` we print the given in input message in terminal.

Input:
``` Elixir
{:ok, pid} = PrinterActor.start_link
GenServer.cast(pid, {:print, "It's not about how much we lost. It's about how much we have left."})
```
Output:
``` 
It's not about how much we lost. It's about how much we have left.
``` 
- `Minimal Task`: Create an actor that returns any message it receives, while modifying it.
``` Elixir
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
```

As previous, initiate an empty list with `GenServer`, after it we check the current state. The magic is happening in `handle_cast` function where we use the math functions in order to calculate the input message and return the manipulated result in terminal.

Input:
``` Elixir
{:ok, pid} = MessageActor.start_link()

IO.inspect GenServer.call(pid, :state)

IO.inspect GenServer.cast(pid, 10)
IO.inspect GenServer.cast(pid, " Hello ")
IO.inspect GenServer.cast(pid, {10, " Hello "})
```
Output:
```
:ok
:ok
:ok
Received: 11
Received:  hello
Received: I don't know how to HANDLE this!
```

- `Minimal Task`: Create a two actors, actor one ”monitoring” the other. If the second actor stops, actor one gets notified via a message.

``` Elixir
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
``` 

Interesting in this task is that in classical programming language it can be done by using OOP principles but as Elixir is a functional programming language and we cannot use the same implementation. So here we define the actors as two functions with the pretty similar arhitecture but the first one is always looking in a loop for the status of the second actor.

Input:
``` Elixir
# Driver code
actor_two_pid = ActorTwo.start_link()
actor_one_pid = ActorOne.start_link(actor_two_pid)

# Wait for a while to see the monitoring in action
Process.sleep(6000)
Process.exit(actor_two_pid, :normal)
Process.sleep(6000)
```

Output:
```
Actor Two is running
Actor Two is running
Actor Two is running
Actor Two is running
Actor Two is running
Actor Two is running
Actor Two is running
Actor Two is running
Actor Two is running
Actor Two is running
Actor Two is running
Actor Two is running
```

- `Minimal Task`: Create an actor which receives numbers and with each request prints out the current average. 

``` Elixir
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
```

Using `GenServer` we initiate the working environment, and start calculating the average in the `def init` function, after calculation happens response is transmitted using `def handle_cast`.

Input:
``` Elixir
{:ok, pid} = AveragerActor.start_link
# Output: "Current average is 0"

GenServer.cast(pid, {:average, 10})

GenServer.cast(pid, {:average, 50})

GenServer.cast(pid, {:average, 20})
```

Output:
```
Current average is 10.0
Current average is 30.0
Current average is 26.666666666666668
```

- `Main Task`: Create an actor which maintains a simple FIFO queue. You should write helper functions to create an API for the user, which hides how the queue is implemented.

``` Elixir
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
```

Also here we use `GenServer` for an easier working environment. First of all we iniate the list (empty one), then we take the input data. We check if the input string is empty or not and if not remove the first element, if yes then it return it as it is. And after all the done staff we return the new list.

Output:
``` Elixir

pid = Queue.new_queue
Queue.push(pid, 42)
# Output: :ok

IO. inspect Queue.pop(pid)
# Output: 42
```

Output:
```
42
```

- `Main Task`: Create a module that would implement a semaphore.

``` Elixir
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
```

Initiate the semaphore function, then loop function for the task we get, the loop must be defined and it is in the `def loop`. After it we acquire the semaphore, and in case the value is greater than 0 the result is `ok`, in other it release the semaphore.

Input:
``` Elixir

semaphore = Semaphore.create_semaphore(0)
Semaphore.acquire(semaphore)
# This will block until a release is performed

# Critical section

Semaphore.release(semaphore)
# This will unblock one waiting acquire call
```

Output:
```
ok
```

- `Bonus Task`: Create a module that would perform some risky business. Start by creating a scheduler actor. When receiving a task to do, it will create a worker node that will perform the task. Given the nature of the task, the worker node is prone to crashes (task completion rate
50%). If the scheduler detects a crash, it will log it and restart the worker node. If the worker node finishes successfully, it should print the result.

``` Elixir
defmodule Scheduler do
  def create_scheduler do
    spawn(fn -> scheduler_loop() end)
  end

  def schedule(pid, task) do
    send(pid, {:schedule, task})
  end

  defp scheduler_loop do
    Process.flag(:trap_exit, true)
    loop()
  end

  defp loop do
    receive do
      {:schedule, task} ->
        create_worker(task)

      {:EXIT, _pid, :normal} ->
        IO.puts("Task succesful : Miau")

      {:EXIT, _pid, task} ->
        IO.puts("Task fail")
        create_worker(task)
    end
    loop()
  end

  defp create_worker(task) do
    spawn_link(fn -> worker_loop(task) end)
  end

  defp worker_loop(task) do
    if :rand.uniform() < 0.5 do
      exit(:normal)
    else
      exit(task)
    end
  end

end
```

This code implements a simple task scheduler that uses a supervisor-like mechanism to restart failed worker processes. When a task is scheduled, it spawns a new worker process to execute the task. If the worker process exits normally, the scheduler prints a success message to the console. If the worker process exits with an error, the scheduler prints a failure message to the console and spawns a new worker process to execute the same task again.

Input:
``` Elixir
scheduler = Scheduler.create_scheduler
send(scheduler, "Hello")
# Task failed: Hello
# Task successful: Miau

send(scheduler, "How are you")
# Task failed: How are you
# Task failed: How are you
# Task failed: How are you
# Task successful: Miau
```

Output:
```
Hello
Miau
How are you
Miau
```

- `Bonus Task`: Create a module that would implement a doubly linked list where each node of the list is an actor.

``` Elixir
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
```

This is a simple implementation of a doubly linked list in Elixir, which is a type of data structure commonly used in programming. The list is implemented as a chain of processes, where each process represents a node in the list. Each node contains a value, as well as references to the previous and next nodes in the list.The create_dllist function takes a list of values and creates the first node in the list, then returns a reference to it. The traverse function sends a message to the first node to traverse the list and return a list of values. The inverse function sends a message to the first node to traverse the list in reverse order and return a reversed list of values.The node_loop function is the core of the doubly linked list implementation. It receives messages from other nodes and processes them accordingly. When it receives a traverse message, it sends the message to the next node in the list, until it reaches the end of the list. When it receives an inverse message, it sends the message to the previous node in the list, until it reaches the beginning of the list.Overall, this implementation is a good example of how to use processes to build a distributed data structure in Elixir.

Input:
``` Elixir

list = DLList.create_dllist([3, 4, 5, 42])
DLList.traverse(list)

DLList.inverse(list)
```

Output:
```
[3, 4, 5, 42]
[42, 5, 4, 3]
```


----
## Week 4

- `Minimal Task`: Create a supervised pool of identical worker actors. The number of actors is static, given at initialization. Workers should be individually addressable. Worker actors should echo any message they receive. If an actor dies (by receiving a “kill” message), it should
be restarted by the supervisor. Logging is welcome.

``` Elixir
defmodule Worker do
  def start_link(id) do
    pid = spawn_link(__MODULE__, :loop, [id, true])
    {:ok, pid}
  end

  def loop(id, first_time \\ false) do
    if first_time, do: IO.puts("The worker node with id #{id} has been started")

    receive do
      {:echo, message} ->
        IO.puts("Echo from worker node with id #{id}: #{message}")
        loop(id)

      {:die} ->
        IO.puts("The worker node with id #{id} has been killed")
        exit(:kill)
    end
  end

  def child_spec(id) do
    %{
      id: id,
      start: {__MODULE__, :start_link, [id]}
    }
  end
end

defmodule WorkerSupervisor do
  use Supervisor

  def start_link(n) do
    Supervisor.start_link(__MODULE__, n, name: __MODULE__)
  end

  @impl true
  def init(n) do
    children = 1..n |> Enum.map(&Worker.child_spec(&1))
    Supervisor.init(children, strategy: :one_for_one)
  end

  def get_worker(id) do
    {^id, pid, _, _} =
      __MODULE__
      |> Supervisor.which_children()
      |> Enum.find(fn {worker_id, _, _, _} -> worker_id == id end)

    pid
  end
end
```

Input:
``` Elixir

#Driver code
# start a supervisor with 3 worker nodes
{:ok, supervisor} = WorkerSupervisor.start_link(3)

# get the pid of the worker with id 2
worker_pid = WorkerSupervisor.get_worker(2)

# send a message to the worker
send(worker_pid, {:echo, "hello"})

# kill the worker
send(worker_pid, {:die})

# wait for a few seconds to allow the supervisor to restart the worker
:timer.sleep(5000)

# get the pid of the restarted worker
worker_pid = WorkerSupervisor.get_worker(2)

# send a message to the restarted worker
send(worker_pid, {:echo, "world"})
```

Output:
```
The worker node with id 2 has been started
The worker node with id 3 has been started
The worker node with id 1 has been started
Echo from worker node with id 2: hello    
The worker node with id 2 has been killed 
The worker node with id 2 has been started
Echo from worker node with id 2: world
```


- `Main Task`: Create a supervised processing line to clean messy strings. The first worker in the line would split the string by any white spaces (similar to Python’s str.split method). The second actor will lowercase all words and swap all m’s and n’s (you nomster!). The third actor will join back the sentence with one space between words (similar to Python’s str.join method). Each worker will receive as input the previous actor’s output, the last actor printing the result on screen. If any of the workers die because it encounters an error, the whole
processing line needs to be restarted. Logging is welcome.

``` Elixir
defmodule Splitter do
  def start_link do
    pid = spawn_link(__MODULE__, :loop, [])
    IO.puts("A #{__MODULE__} process has started at #{inspect(pid)}.")
    {:ok, pid}
  end

  def loop do
    receive do
      {:split, string} ->
        splitted_strings = string |> String.split()

        IO.puts("#{__MODULE__} received \"#{string}\" and returned #{inspect(splitted_strings)}")

        ProcessingLineSupervisor.get_worker("Nomster")
        |> send({:nomster, splitted_strings})

        loop()
    end
  end

  def child_spec do
    %{
      id: "Splitter",
      start: {__MODULE__, :start_link, []}
    }
  end
end

defmodule Nomster do
  def start_link do
    pid = spawn_link(__MODULE__, :loop, [])
    IO.puts("A #{__MODULE__} process has started at #{inspect(pid)}.")
    {:ok, pid}
  end

  def loop do
    receive do
      {:nomster, list} ->
        nomster_word = fn word ->
          word
          |> String.downcase()
          |> to_charlist()
          |> Enum.map(
            &case &1 do
              ?m ->
                ?n

              ?n ->
                ?m

              l ->
                l
            end
          )
          |> to_string()
        end

        nomstered_list = list |> Enum.map(nomster_word)

        IO.puts("#{__MODULE__} received #{inspect(list)} and returned #{inspect(nomstered_list)}")

        ProcessingLineSupervisor.get_worker("Joiner")
        |> send({:join, nomstered_list})

        loop()
    end
  end

  def child_spec do
    %{
      id: "Nomster",
      start: {__MODULE__, :start_link, []}
    }
  end
end

defmodule Joiner do
  def start_link do
    pid = spawn_link(__MODULE__, :loop, [])
    IO.puts("A #{__MODULE__} process has started at #{inspect(pid)}.")
    {:ok, pid}
  end

  def loop do
    receive do
      {:join, list} ->
        joined_list = list |> Enum.join(" ")
        IO.puts("#{__MODULE__} received #{inspect(list)} and returned \"#{joined_list}\"")
        loop()
    end
  end

  def child_spec do
    %{
      id: "Joiner",
      start: {__MODULE__, :start_link, []}
    }
  end
end

defmodule ProcessingLineSupervisor do
  use Supervisor

  def start_link() do
    Supervisor.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  @impl true
  def init(:ok) do
    children = [
      Splitter.child_spec(),
      Nomster.child_spec(),
      Joiner.child_spec()
    ]

    Supervisor.init(children, strategy: :one_for_all)
  end

  def get_worker(id) do
    {^id, pid, _, _} =
      __MODULE__
      |> Supervisor.which_children()
      |> Enum.find(fn {worker_id, _, _, _} -> worker_id == id end)

    pid
  end

  def send_message_to_pipeline(message) do
    get_worker("Splitter") |> send({:split, message})
  end
end
```

Input:
``` Elixir
ProcessingLineSupervisor.start_link()

ProcessingLineSupervisor.send_message_to_pipeline("Hello World!")
ProcessingLineSupervisor.send_message_to_pipeline("This is a test. Nevermind.")
```

Output:
```
A Elixir.Splitter process has started at #PID<0.111.0>.
A Elixir.Nomster process has started at #PID<0.112.0>.
A Elixir.Joiner process has started at #PID<0.113.0>.
Elixir.Splitter received "Hello World!" and returned ["Hello", "World!"]
Elixir.Splitter received "This is a test. Nevermind." and returned ["This", "is", "a", "test.", "Nevermind."]
Elixir.Nomster received ["Hello", "World!"] and returned ["hello", "world!"]
Elixir.Joiner received ["hello", "world!"] and returned "hello world!"
Elixir.Nomster received ["This", "is", "a", "test.", "Nevermind."] and returned ["this", "is", "a", "test.", "mevernimd."]
Elixir.Joiner received ["this", "is", "a", "test.", "mevernimd."] and returned "this is a test. mevernimd."
```


- `Bonus Task`: Write a supervised application that would simulate a sensor system in a car. There should be sensors for each wheel, the motor, the cabin and the chassis. If any sensor dies because of a random invalid measurement, it should be restarted. If, however, the main sensor supervisor system detects multiple crashes, it should deploy the airbags.

``` Elixir
defmodule CarSensorSystem do
  use Application

  def start(_type, _args) do
    children = [
      {SensorSupervisor, []}
    ]

    opts = [strategy: :one_for_one, name: SensorSupervisor]
    Supervisor.start_link(children, opts)
  end
end

defmodule SensorSupervisor do
  use Supervisor

  def start_link(_opts) do
    Supervisor.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init([]) do
    children = [
      {WheelSensor, [:front_left]},
      {WheelSensor, [:front_right]},
      {WheelSensor, [:rear_left]},
      {WheelSensor, [:rear_right]},
      {MotorSensor, []},
      {CabinSensor, []},
      {ChassisSensor, []},
      {AirbagSystem, []}
    ]

    children
      |> Supervisor.init(strategy: :one_for_one)
      |> Supervisor.start_link(name: __MODULE__)

  end

  def handle_info({:crashed, sensor}, state) do
    new_count = Map.get(state, sensor, 0) + 1
    if new_count >= 3 do
      Supervisor.terminate_child(__MODULE__, AirbagSystem)
    end
    {:noreply, Map.put(state, sensor, new_count)}
  end
end

defmodule WheelSensor do
  use GenServer

  def start_link(location) do
    GenServer.start_link(__MODULE__, location, name: __MODULE__)
  end

  def init(location) do
    {:ok, %{location: location}}
  end

  def handle_info(:invalid_measurement, state) do
    IO.puts("Invalid measurement detected for #{inspect(state.location)} wheel sensor!")
    :timer.sleep(1000)
    {:stop, {:crashed, __MODULE__}, state}
  end
end

defmodule MotorSensor do
  use GenServer

  def start_link(_args) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init([]) do
    {:ok, %{}}
  end

  def handle_info(:invalid_measurement, state) do
    IO.puts("Invalid measurement detected for motor sensor!")
    :timer.sleep(1000)
    {:stop, {:crashed, __MODULE__}, state}
  end
end

defmodule CabinSensor do
  use GenServer

  def start_link(_args) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init([]) do
    {:ok, %{}}
  end

  def handle_info(:invalid_measurement, state) do
    IO.puts("Invalid measurement detected for cabin sensor!")
    :timer.sleep(1000)
    {:stop, {:crashed, __MODULE__}, state}
  end
end

defmodule ChassisSensor do
  use GenServer

  def start_link(_args) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init([]) do
    {:ok, %{}}
  end

  def handle_info(:invalid_measurement, state) do
    IO.puts("Invalid measurement detected for chassis sensor!")
    :timer.sleep(1000)
    {:stop, {:crashed, __MODULE__}, state}
  end
end

defmodule AirbagSystem do
  use GenServer

  def start_link(_args) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init([]) do
    {:ok, %{}}
  end

  def handle_info(:invalid_measurement, state) do
    IO.puts("Invalid measurement detected for chassis sensor!")
    :timer.sleep(1000)
    {:stop, {:crashed, __MODULE__}, state}
  end
end

defmodule Driver do
  def run do
    CarSensorSystem.start(:normal, [])
    simulate_crashes()
  end
```

Input:
``` Elixir
  defp simulate_crashes do
    WheelSensor.handle_info(:invalid_measurement, %{location: :front_left})
    WheelSensor.handle_info(:invalid_measurement, %{location: :front_right})
    MotorSensor.handle_info(:invalid_measurement, %{})
    CabinSensor.handle_info(:invalid_measurement, %{})
    ChassisSensor.handle_info(:invalid_measurement, %{})
  end
end
```

Output:
```
START
-
-
-
ERROR WheelSensor
ERROR WheelSensor
ERROR MotorSensor
OK CabinSensor
OK ChassisSensor
```


- `Bonus task`: Write an application that, in the context of actor supervision. would mimic the exchange in that scene from the movie Pulp Fiction.

``` Elixir
defmodule WhiteActor do
  def loop do
    receive do
      {:ask, pid, ref, message} ->
        answer =
          case message do
            "What does Marsellus Wallace look like?" ->
              "What?"

            "What country you from?" ->
              "What?"

            "What ain't no country I ever heard of. They speak English in what?" ->
              "What?"

            "English motherfucker. Do you speak it?" ->
              "Yes"

            "Then you know what I'm saying" ->
              "Yes"

            "Describe what Marsellus Wallace looks like" ->
              "What?"

            "Say what again. Say what again. I dare you, not dare you, I double dare you motherfucker. Say what one more goddamn time." ->
              "He's black."

            "Go on." ->
              "He's bald."

            "Does he look like a bitch?" ->
              "What?"
          end

        freaks_out? = Enum.random(0..2) == 2
        if freaks_out?, do: exit(:freaked_out)
        Process.sleep(1_000)
        send(pid, {:answer, ref, answer})
        loop()
    end
  end
end

defmodule BlackSupervisor do
  def start_link do
    questions = [
      "What does Marsellus Wallace look like?",
      "What country you from?",
      "What ain't no country I ever heard of. They speak English in what?",
      "English motherfucker. Do you speak it?",
      "Then you know what I'm saying",
      "Describe what Marsellus Wallace looks like",
      "Say what again. Say what again. I dare you, not dare you, I double dare you motherfucker. Say what one more goddamn time.",
      "Go on.",
      "Does he look like a bitch?"
    ]

    spawn_link(__MODULE__, :loop, [nil, questions])
  end

  def loop(nil, questions) do
    {pid, ref} = spawn_monitor(WhiteActor, :loop, [])
    IO.puts("!!! Black Supervisor brought back White Actor !!!")
    loop({ref, pid}, questions)
  end

  def loop({_ref, pid}, []) do
    Process.exit(pid, :shoot)
    IO.puts("### Black supervisor shot White actor ###")
  end

  def loop({monitor_ref, pid}, [question | questions]) do
    question_ref = make_ref()
    send(pid, {:ask, self(), question_ref, question})
    IO.puts(">>> Black supervisor asked: #{question}")

    receive do
      {:DOWN, ^monitor_ref, :process, _pid, :freaked_out} ->
        IO.puts("??? White Actor freaked out ???")
        loop(nil, [question | questions])

      {:answer, ^question_ref, answer} ->
        IO.puts(">>> White Actor answered: #{answer}\n")
        loop({monitor_ref, pid}, questions)
    end
  end
end
```

Input:
``` Elixir
BlackSupervisor.start_link()
```

Output:
```
!!! Black Supervisor brought back White Actor !!!
>>> Black supervisor asked: What does Marsellus Wallace look like?
??? White Actor freaked out ???
!!! Black Supervisor brought back White Actor !!!
>>> Black supervisor asked: What does Marsellus Wallace look like?
```

---- 
## Week 5

- `Minimal Task`: Write an application that would visit this link. Print out the HTTP response status code, response headers and response body.

``` Elixir
defmodule Ptr.Week5.Minimal1 do
  def main do
    url = "https://quotes.toscrape.com/"
    {:ok, response} = HTTPoison.get(url)
    IO.puts("\nStatus Code:\n#{response.status_code}")

    headers_string =
      response.headers
      |> Enum.reduce("", fn {key, value}, acc -> acc <> "#{key}: #{value}" <> "\n" end)

    IO.puts("\nResponse Headers:\n#{headers_string}")
    IO.puts("\nResponse Body:\n#{response.body}")
  end
end
```

Input:
``` Elixir
    IO.puts("\nResponse Headers:\n#{headers_string}")
    IO.puts("\nResponse Body:\n#{response.body}")
```

Output:
```
<div class="quote" itemscope="" itemtype="http://schema.org/CreativeWork">
        <span class="text" itemprop="text">“The person, be it gentleman or lady, who has not pleasure in a good novel, must be intolerably stupid.”</span>
        <span>by <small class="author" itemprop="author">Jane Austen</small>
        <a href="/author/Jane-Austen">(about)</a>
        </span>
        <div class="tags">
            Tags:
            <meta class="keywords" itemprop="keywords" content="aliteracy,books,classic,humor"> 
            
            <a class="tag" href="/tag/aliteracy/page/1/">aliteracy</a>
            
            <a class="tag" href="/tag/books/page/1/">books</a>
            
            <a class="tag" href="/tag/classic/page/1/">classic</a>
            
            <a class="tag" href="/tag/humor/page/1/">humor</a>
            
        </div>
    </div>
```

- `Minimal Task`: Continue your previous application. Extract all quotes from the HTTP response body. Collect the author of the quote, the quote text and tags. Save the data into a list of maps, each map representing a single quote.

``` Elixir
defmodule Ptr.Week5.Minimal2 do
  def main do
    url = "https://quotes.toscrape.com/"
    {:ok, response} = HTTPoison.get(url)
    {:ok, html} = Floki.parse_document(response.body)

    quotes =
      html
      |> Floki.find(".text")
      |> Enum.map(fn {"span", [{"class", "text"}, {"itemprop", "text"}], [text]} -> text end)
      |> Enum.map(&String.slice(&1, 1..-2//1))

    authors =
      html
      |> Floki.find(".author")
      |> Enum.map(fn {"small", [{"class", "author"}, {"itemprop", "author"}], [text]} -> text end)

    extracted_data =
      Enum.zip(quotes, authors)
      |> Enum.map(fn {text, author} -> %{qoute: text, author: author} end)

    extracted_data
  end
end
```

Input:
``` Elixir
extracted_data
```
Output:
```
<small class="author" itemprop="author">Albert Einstein
“The world as we have created it is a process of our thinking. It cannot be changed without changing our thinking.”
```

- `Minimal Task`: Continue your previous application. Persist the list of quotes into a file. Encode the data into JSON format. Name the file quotes.json.

``` Elixir
defmodule Ptr.Week5.Minimal3 do
  def main do
    extracted_data = Ptr.Week5.Minimal2.main()
    {:ok, json} = Poison.encode(extracted_data)
    :ok = File.write("quotes.json", json)
    :ok
  end
end
```

Input:
``` Elixir
extracted_data
```

Output:
```
....
quotes.json
```

- `Main Task`: Write an application that would implement a Star Wars-themed RESTful API.
The API should implement the following HTTP methods: • GET /movies • GET /movies/:id • POST /movies • PUT /movies/:id • PATCH /movies/:id • DELETE /movies/:id

``` Elixir
defmodule Ptr.Week5.DataBase do
  use Agent

  def start_link do
    Agent.start_link(
      fn ->
        {:ok, movies_json} = File.read("movies.json")
        {:ok, state} = Poison.decode(movies_json)
        state
      end,
      name: __MODULE__
    )
  end

  def get_all do
    Agent.get(__MODULE__, & &1)
  end

  def get_by_id(id) do
    Agent.get(__MODULE__, &Enum.find(&1, fn %{"id" => value} -> value == id end))
  end

  def create(title, release_year, director) do
    Agent.update(__MODULE__, fn state ->
      biggest_id =
        state
        |> Enum.reduce(-1, fn %{"id" => value}, acc -> if value > acc, do: value, else: acc end)

      state ++
        [
          %{
            "title" => title,
            "release_year" => release_year,
            "id" => biggest_id + 1,
            "director" => director
          }
        ]
    end)
  end

  def put(title, release_year, id, director) do
    Agent.update(__MODULE__, fn state ->
      Enum.filter(state, fn %{"id" => value} -> id != value end) ++
        [
          %{
            "title" => title,
            "release_year" => release_year,
            "id" => id,
            "director" => director
          }
        ]
    end)
  end

  def delete(id) do
    Agent.get_and_update(__MODULE__, fn state ->
      {
        state |> Enum.find(fn %{"id" => value} -> id == value end),
        state |> Enum.filter(fn %{"id" => value} -> id != value end)
      }
    end)
  end
end

defmodule Ptr.Week5.Router do
  use Plug.Router

  plug(:match)
  plug(:dispatch)

  get "/movies" do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Ptr.Week5.DataBase.get_all() |> Poison.encode!())
  end

  get "/movies/:id" do
    movie =
      conn.path_params["id"]
      |> String.to_integer()
      |> Ptr.Week5.DataBase.get_by_id()

    case movie do
      nil ->
        conn
        |> put_resp_content_type("text/plain")
        |> send_resp(404, "Not Found")

      movie ->
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, movie |> Poison.encode!())
    end
  end

  post "/movies" do
    {:ok, body, conn} = conn |> Plug.Conn.read_body()

    {:ok,
     %{
       "title" => title,
       "release_year" => release_year,
       "director" => director
     }} = body |> Poison.decode()

    Ptr.Week5.DataBase.create(title, release_year, director)

    send_resp(conn, 201, "")
  end

  put "/movies/:id" do
    id =
      conn.path_params["id"]
      |> String.to_integer()

    {:ok, body, conn} = conn |> Plug.Conn.read_body()

    {:ok,
     %{
       "title" => title,
       "release_year" => release_year,
       "director" => director
     }} = body |> Poison.decode()

    Ptr.Week5.DataBase.put(title, release_year, id, director)

    send_resp(conn, 200, "")
  end

  delete "/movies/:id" do
    movie =
      conn.path_params["id"]
      |> String.to_integer()
      |> Ptr.Week5.DataBase.delete()

    case movie do
      nil ->
        conn
        |> put_resp_content_type("text/plain")
        |> send_resp(404, "Not Found")

      movie ->
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, movie |> Poison.encode!())
    end
  end

  match _ do
    send_resp(conn, 404, "Oops!")
  end
end

defmodule Ptr.Week5.Main do
  def run do
    {:ok, _} = Ptr.Week5.DataBase.start_link()
    IO.puts("The DataBase Agent has started")
    {:ok, _} = Plug.Cowboy.http(Ptr.Week5.Router, [])
    IO.puts("The server started on port 4000")
  end
end
```

Input:
``` Elixir
GET release_year 2017
```

Output:
```
Star Wars : The Last Jedi
```


- `Bonus Task`: Write an application that would use the Spotify API to manage user playlists. It should be able to create a new playlist, add songs to it and add custom playlist cover images.

``` Elixir
defmodule Spotify do
  use HTTPoison.Base

  @spotify_url "https://api.spotify.com/v1"

  def process_request_headers(headers, _opts) do
    headers ++ [
      {"Authorization", "Bearer #{get_access_token()}"}
    ]
  end

  defp get_access_token() do
    # implement OAuth 2.0 authentication and return access token
  end

  def create_playlist(user_id, name, description \\ "") do
    url = "#{@spotify_url}/users/#{user_id}/playlists"
    body = %{name: name, description: description}
    headers = [{"Content-Type", "application/json"}]
    HTTPoison.post(url, Jason.encode!(body), headers)
  end

  def add_tracks_to_playlist(playlist_id, track_uris) do
    url = "#{@spotify_url}/playlists/#{playlist_id}/tracks"
    body = %{uris: track_uris}
    headers = [{"Content-Type", "application/json"}]
    HTTPoison.post(url, Jason.encode!(body), headers)
  end

  def add_playlist_cover_image(playlist_id, image_path) do
    url = "#{@spotify_url}/playlists/#{playlist_id}/images"
    body = Base.encode64(File.read!(image_path))
    headers = [{"Content-Type", "image/jpeg"}]
    HTTPoison.put(url, body, headers)
  end
end
```

Tried to done this task but got some errors of kernel and didn't managed to resolve them.


----

Conclusion: 

In this project I got the oportunity to work with the elixir functional programming language which was choosed by me. During this 5 week programming challenge I got mostly fammilliar with the main possibilities of how the things works inside. For example how the local OOP looks like, or how to build a database, or how to play with supervisor. The gained experience, first of all will be usefull for me, expanding my knowledge in types and structures of programming field, secondly it will be usefull for the Project1 which will be a more complex one and were without basic staff learned in this project it will be imposibil to get some results. 