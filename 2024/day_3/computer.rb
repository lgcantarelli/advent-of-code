require_relative 'memory'

class Computer
  def initialize
    @memory = Memory.new
  end

  def process
    @memory.operations.sum(&:evaluate)
  end
end
