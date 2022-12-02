defmodule Day2 do

  def get_score(round) do
    round |> String.split(" ", trim: true)
      |> case do
        ["A", "X"] -> 3 + 1
        ["A", "Y"] -> 6 + 2
        ["A", "Z"] -> 0 + 3
        ["B", "X"] -> 0 + 1
        ["B", "Y"] -> 3 + 2
        ["B", "Z"] -> 6 + 3
        ["C", "X"] -> 6 + 1
        ["C", "Y"] -> 0 + 2
        ["C", "Z"] -> 3 + 3
        [] -> 0
      end
  end

  def get_needed_score(round) do
    round |> String.split(" ", trim: true)
      |> case do
        ["A", "X"] -> 0 + 3
        ["A", "Y"] -> 3 + 1
        ["A", "Z"] -> 6 + 2
        ["B", "X"] -> 0 + 1
        ["B", "Y"] -> 3 + 2
        ["B", "Z"] -> 6 + 3
        ["C", "X"] -> 0 + 2
        ["C", "Y"] -> 3 + 3
        ["C", "Z"] -> 6 + 1
        [] -> 0
      end
  end
  
  def task1 do
    File.read!("../inputs/day2_input.txt") |> String.split("\n") |> Enum.map(&get_score/1) |> Enum.sum()
  end

  def task2 do
    File.read!("../inputs/day2_input.txt") |> String.split("\n") |> Enum.map(&get_needed_score/1) |> Enum.sum()
  end
end
