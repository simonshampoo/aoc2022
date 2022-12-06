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

$hands = Hash["A" => Hands::ROCK,
              "B" => Hands::PAPER,
              "C" => Hands::SCISSORS,
              "X" => Hands::ROCK,
              "Y" => Hands::PAPER,
              "Z" => Hands::SCISSORS
]

class Solution
  def solve
    ans = 0
    outcomes = Hash["X" => Outcomes::LOSS, "Y" => Outcomes::DRAW, "Z" => Outcomes::WIN]
    File.readlines("./input.txt").each do |line|
      match = line.split(" ")
      opponent = match[0]
      me = match[1]

      if hands[opponent] == Hands::ROCK
        if hands[me] == Hands::PAPER
          ans += Outcomes::WIN
        elsif hands[me] == Hands::ROCK
          ans += Outcomes::DRAW
        end
      end
      if hands[opponent] == Hands::SCISSORS
        if hands[me] == Hands::ROCK
          ans += Outcomes::WIN
        elsif hands[me] == Hands::SCISSORS
          ans += Outcomes::DRAW
        end
      end
      if hands[opponent] == Hands::PAPER
        if hands[me] == Hands::SCISSORS
          ans += Outcomes::WIN
        elsif hands[me] == Hands::PAPER
          ans += Outcomes::DRAW
        end
      end
      ans += hands[me]
    end
    puts "my score #{ans}"
  end

  def solve2()
    File.readlines("./input.txt").each do |line|
      game = line.split(" ")
      opponent = game[0]
      me = game[1]
    end
  end
end

Solution.new.solve
