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
          "C" => Hands::SCISSORS }

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
    ans = 0
    File.readlines("./input.txt").each do |line|
      game = line.split(" ")
      opponent = game[0]
      result = game[1]

      if $hand[opponent] == Hands::ROCK
        if $outcomes[result] == Outcomes::WIN
          ans += Outcomes::WIN + Hands::PAPER
        elsif $outcomes[result] == Outcomes::DRAW
          ans += Outcomes::DRAW + Hands::ROCK
        else
          ans += Outcomes::LOSS + Hands::SCISSORS
        end
      end
      if $hand[opponent] == Hands::SCISSORS
        if $outcomes[result] == Outcomes::WIN
          ans += Outcomes::WIN + Hands::ROCK
        elsif $outcomes[result] == Outcomes::DRAW
          ans += Outcomes::DRAW + Hands::SCISSORS
        else
          ans += Outcomes::LOSS + Hands::PAPER
        end
      end
      if $hand[opponent] == Hands::PAPER
        if $outcomes[result] == Outcomes::WIN
          ans += Outcomes::WIN + Hands::SCISSORS
        elsif $outcomes[result] == Outcomes::DRAW
          ans += Outcomes::DRAW + Hands::PAPER
        else
          ans += Outcomes::LOSS + Hands::ROCK
        end
      end
    end
    ans
  end
end

#Solution.new.solve
puts Solution.new.solve2
