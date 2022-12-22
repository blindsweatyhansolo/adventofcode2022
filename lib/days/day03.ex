defmodule Days.Day03 do
  def parse_input do
    File.read!("lib/inputs/day03.txt")
    |> String.split("\r\n")
    # drop any random empty lists
    |> Enum.reject(&(&1 == ""))
  end

  defp rucksack_priority(contents) do
    # size of compartments is half of the line's byte size (div/2)
    compartment_size = div(byte_size(contents), 2)

    # bin_to_list(subject, position, length)
    first_compartment = :binary.bin_to_list(contents, 0, compartment_size)
    second_compartment = :binary.bin_to_list(contents, compartment_size, compartment_size)

    # use find() to iterate through each item, returns list of characters that return truthy match
    # send list to priority() for list of int values of characters
    first_compartment |> Enum.find(fn char -> char in second_compartment end) |> priority()
  end

  defp group_priority([elf_1, elf_2, elf_3]) do
    elf_1 = :binary.bin_to_list(elf_1)
    elf_2 = :binary.bin_to_list(elf_2)
    elf_3 = :binary.bin_to_list(elf_3)

    # compare elf_1's items against elf_2 and elf_3, return character that is truthy match
    elf_1 |> Enum.find(fn char -> char in elf_2 and char in elf_3 end) |> priority()
  end

  defp priority(char) when char in ?a..?z do
    char - ?a + 1
  end

  defp priority(char) when char in ?A..?Z do
    char - ?A + 27
  end

  def sum_rucksack_priorities do
    rucksack_sum =
      parse_input()
      |> Enum.map(&rucksack_priority/1)
      |> Enum.sum()

    IO.puts(
      "Priorities sum of item types in both compartments of each rucksack is #{rucksack_sum}."
    )
  end

  def sum_group_priority do
    group_sum =
      parse_input()
      |> Enum.chunk_every(3)
      |> Enum.map(&group_priority/1)
      |> Enum.sum()

    IO.puts("Priorities sum of items for each three Elf group is #{group_sum}.")
  end

  def solution do
    sum_rucksack_priorities()
    sum_group_priority()

    IO.puts("THAT'S A LOT OF STUFF!")
  end
end
