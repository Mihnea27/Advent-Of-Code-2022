defmodule Day6 do

  def task1 do
    File.read!("../inputs/day6_input.txt") |> getStringMarker(4) 
  end

  def task2 do
    File.read!("../inputs/day6_input.txt") |> getStringMarker(14)
  end
  
  def getStringMarker(str, len) do
    l = String.length(str)
    for i <- 0..l-len do
      substr = String.slice(str, i, len)
      m = MapSet.new(String.to_charlist(substr))
      if Enum.count(m) == len do
        IO.puts(i + len)
      end
    end
  end

end
