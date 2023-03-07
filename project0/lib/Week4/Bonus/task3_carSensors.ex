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

  defp simulate_crashes do
    WheelSensor.handle_info(:invalid_measurement, %{location: :front_left})
    WheelSensor.handle_info(:invalid_measurement, %{location: :front_right})
    MotorSensor.handle_info(:invalid_measurement, %{})
    CabinSensor.handle_info(:invalid_measurement, %{})
    ChassisSensor.handle_info(:invalid_measurement, %{})
  end
end
