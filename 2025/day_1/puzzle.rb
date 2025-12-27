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
      p "#{direction}, #{size}"
      points_at = @dial.rotate(direction, size)
      p "points at: #{points_at}"
      password += 1 if points_at.zero?
    end
    
    password
  end
end

puzzle = Puzzle.new
p puzzle.solve