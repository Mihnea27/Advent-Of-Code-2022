defmodule Day3 do
  
  def getItemValue(item) do
    item |> String.to_charlist() |> Enum.map(fn x -> 
      if x >= 97 do
        x - 96
      else
        x - 65 + 27
      end
    end) |> Enum.sum()
  end 

  def getScores(line) do
    elements = getListElements(line)
    len = elements |> length()
    split_list = elements |> Enum.split(div(len, 2))
    
    first_compartiment = split_list |> elem(0)
    second_compartiment = split_list |> elem(1)
    
    aux_list = first_compartiment -- second_compartiment
    common_element = first_compartiment -- aux_list

    common_element |> Enum.at(0)
  end

  def getListElements(line) do
    line |> String.split("", trim: true) |> Enum.reverse() |> tl() |> Enum.map(&getItemValue/1)
  end

  def getScoreByGroup(group) do
    element_per_group = group |> Enum.map(&getListElements/1)
    aux_list = Enum.at(element_per_group, 0) -- Enum.at(element_per_group, 1)
    aux_list2 = Enum.at(element_per_group, 0) -- aux_list
    aux_list3 = Enum.at(element_per_group, 2) -- aux_list2
    common_element = Enum.at(element_per_group, 2) -- aux_list3
    common_element |> Enum.at(0)
  end
  
  def task1 do
   File.read!("../inputs/day3_input.txt") |> String.split("\n") |> Enum.reverse() |> tl() |> Enum.map(&getScores/1) |> Enum.sum()
  end

  def task2 do
    File.read!("../inputs/day3_input.txt") 
      |> String.split("\n") 
      |> Enum.reverse() 
      |> tl() 
      |> Enum.reverse() 
      |> Enum.chunk_every(3)
      |> Enum.map(&getScoreByGroup/1)
      |> Enum.sum()
  end
  
end
