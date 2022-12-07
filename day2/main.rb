module Hands
  ROCK = 1
  PAPER = 2
  SCISSORS = 3
end

module Outcomes
  LOSS = 0
  DRAW = 3
  WIN = 6
end

$hand = { "A" => Hands::ROCK,
          "B" => Hands::PAPER,
          "C" => Hands::SCISSORS,
          "X" => Hands::ROCK,
          "Y" => Hands::PAPER,
          "Z" => Hands::SCISSORS }

$outcomes = { "X" => Outcomes::LOSS, "Y" => Outcomes::DRAW, "Z" => Outcomes::WIN }

class Solution
  def solve
    ans = 0
    File.readlines("./input.txt").each do |line|
      match = line.split(" ")
      opponent = match[0]
      me = match[1]

      if $hand[opponent] == Hands::ROCK
        if $hand[me] == Hands::PAPER
          ans += Outcomes::WIN
        elsif $hand[me] == Hands::ROCK
          ans += Outcomes::DRAW
        end
      end
      if $hand[opponent] == Hands::SCISSORS
        if $hand[me] == Hands::ROCK
          ans += Outcomes::WIN
        elsif $hand[me] == Hands::SCISSORS
          ans += Outcomes::DRAW
        end
      end
      if $hand[opponent] == Hands::PAPER
        if $hand[me] == Hands::SCISSORS
          ans += Outcomes::WIN
        elsif $hand[me] == Hands::PAPER
          ans += Outcomes::DRAW
        end
      end
      ans += $hand[me]
    end
    puts "my score #{ans}"
  end

  def solve2()
    File.readlines("./input.txt").each do |line|
      game = line.split(" ")
      opponent = game[0]
      result = game[1]

      if $hand[opponent] == Hands::ROCK
        if $outcomes[result] == Outcomes::WIN
        elsif $outcomes[result] == Outcomes::DRAW
        else
        end
      end
      if $hand[opponent] = Hands::SCISSORS
        if $outcomes[result] == Outcomes::WIN
        elsif $outcomes[result] == Outcomes::DRAW
        else
        end
      end
      if $hand[opponent] = Hands::PAPER
        if $outcomes[result] == Outcomes::WIN
        elsif $outcomes[result] == Outcomes::DRAW
        else
        end
      end
    end
  end
end

Solution.new.solve
Solution.new.solve2
