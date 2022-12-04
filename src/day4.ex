defmodule Day4 do
 
  def checkIntervals([x..y, a..b]) do
    (x >= a && y <= b) || (a >= x && b <= y)
  end

  def checkOverlap([x..y, a..b]) do
    (x <= b) && (y >= a)
  end

  def task1 do
   File.read!("../inputs/day4_input.txt") 
    |> String.trim() 
    |> String.split("\n") 
    |> Enum.map(&parseInterval/1)
    |> Enum.filter(&checkIntervals/1)
    |> Enum.count()
  end

  def task2 do
    File.read!("../inputs/day4_input.txt")
      |> String.trim()
      |> String.split("\n")
      |> Enum.map(&parseInterval/1)
      |> Enum.filter(&checkOverlap/1)
      |> Enum.count()
  end

  def parseInterval(interval) do
    interval |> String.split(",") |> Enum.map(&transformInterval/1)
  end

  def transformInterval(interval) do
    interval |> String.split("-") |> Enum.map(&String.to_integer/1) |> (fn [first, last] -> first..last end).()
  end

end
