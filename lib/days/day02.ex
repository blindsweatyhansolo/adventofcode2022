defmodule Days.Day02 do
  # win = 6 pts
  # draw = 3 pts
  # lose = 0 pts

  # PART ONE:
  # string values in round represent thrown hand for opp and self
  # rock [A, X] = 1 pt
  # paper [B, Y] = 2 pts
  # scissors [C, Z] = 3 pts
  @points_part1 %{
    "A X" => 1 + 3,
    "A Y" => 2 + 6,
    "A Z" => 3 + 0,
    "B X" => 1 + 0,
    "B Y" => 2 + 3,
    "B Z" => 3 + 6,
    "C X" => 1 + 6,
    "C Y" => 2 + 0,
    "C Z" => 3 + 3
  }

  # PART TWO:
  # elf lied, second value is desired outcome of round
  # self_lose = X
  # self_draw = Y
  # self_win = Z
  @points_part2 %{
    "A X" => 3 + 0,
    "A Y" => 1 + 3,
    "A Z" => 2 + 6,
    "B X" => 1 + 0,
    "B Y" => 2 + 3,
    "B Z" => 3 + 6,
    "C X" => 2 + 0,
    "C Y" => 3 + 3,
    "C Z" => 1 + 6
  }

  # read input file, split on line break
  def parse_input do
    File.read!("lib/inputs/day02.txt")
    |> String.split("\r\n", trim: true)
  end

  # using parsed data, map each as round, send each round through @points_part1
  # returns as list of score for each round, sum
  def part1_total_score do
    score =
      parse_input()
      |> Enum.map(fn round -> @points_part1[round] end)
      |> Enum.sum()

    IO.puts("Part One: my total score is #{score}")
  end

  # using parsed data, map each as round, send each round through @points_part2
  # returns list of score for each round, sum
  def part2_total_score do
    score =
      parse_input()
      |> Enum.map(fn round -> @points_part2[round] end)
      |> Enum.sum()

    IO.puts("Part Two: my total score is #{score}")
  end

  def solution do
    part1_total_score()
    part2_total_score()
    IO.puts("These elves are tricky buggers.")
  end
end
