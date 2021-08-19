defmodule Memory do
  use GenServer

  @impl true
  def init([]) do
  {:ok, []}
	end

  @impl true
  def handle_call({:allocate, chars}, _from, state) do
    data = Enum.map(1..chars, fn _ -> "a" end)
    {:reply, :ok, [data | state]}
  end

  def handle_call(:clear, _from, _strate) do
    {:reply, :ok, []}
  end

  def handle_call(:noop, _from, state) do
    {:reply, :ok, state}
  end

  def handle_call(:clear_hibernate, _from, _state) do
    {:reply, :ok, [], :bibernate}
  end
end
