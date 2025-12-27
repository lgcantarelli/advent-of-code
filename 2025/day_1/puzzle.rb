require_relative 'dial'
require_relative 'sequence'

class Puzzle
  def initialize
    @dial = Dial.new
    @sequence = Sequence.new
  end

  def solve
    password = 0

    @sequence.each do |direction, size|
      points_at = @dial.rotate(direction, size)
      password += 1 if points_at.zero?
    end
    
    password
  end
end

answer = 1066
result = Puzzle.new.solve
p "Result is #{result}. Is this correct? #{answer == result}."