defmodule Days.Day01 do
  # read input file, split on double line break, map each in list as elf, parse to integers, return sum of each elf
  def parse_input do
    File.read!("lib/inputs/day01.txt")
    |> String.split("\r\n\r\n", trim: true)
    |> Enum.map(fn elf ->
      elf
      |> String.split("\r\n", trim: true)
      |> Enum.map(&String.to_integer/1)
      |> Enum.sum()
    end)
  end

  # using list of elf calorie sums, sort and reverse order to return descending list
  def sort_elves_by_calories do
    parse_input()
    |> Enum.sort()
    |> Enum.reverse()
  end

  # get first element of sorted elf list, print out answer
  def most_calories do
    most_cals =
      sort_elves_by_calories()
      |> List.first()

    IO.puts("The Elf with highest total has #{most_cals} Calories on hand.")
  end

  # get top three elves from sorted elf list, return sum of all three
  def top_three_summed do
    summed_cals =
      sort_elves_by_calories()
      |> Enum.take(3)
      |> Enum.sum()

    IO.puts("Top three Elves are carrying a total of #{summed_cals} Calories.")
  end
end
