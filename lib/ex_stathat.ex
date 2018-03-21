defmodule ExStathat do
  def count(stat, amount) do
    Task.Supervisor.start_child(ExStathat.TaskSupervisor, fn ->
      ExStathat.API.Stathat.post(stat: stat, count: amount)
    end)
  end

  def value(stat, value) do
    Task.Supervisor.start_child(ExStathat.TaskSupervisor, fn ->
      ExStathat.API.Stathat.post(stat: stat, value: value)
    end)
  end
end
