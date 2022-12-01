defmodule Day1 do
  def total_food(read_values) do
    read_values |> String.split("\n", trim: true) |> Enum.map(&String.to_integer/1) |> Enum.sum()
  end

  def task1 do
    File.read!("../inputs/day1_input.txt") |> String.split("\n\n") |> Enum.map(&total_food/1) |> Enum.max()    
  end

  def task2 do
    File.read!("../inputs/day1_input.txt") |> String.split("\n\n") |> Enum.map(&total_food/1) |> Enum.sort(&(&1 >= &2)) |> Enum.take(3) |> Enum.sum()
  end
end
