require_relative 'computer'

class MullItOver
  def initialize
    @computer = Computer.new
  end

  def print
    init = Time.now
    p "Multiplications added up: #{@computer.process}"

    time = Time.now - init
    p "Executed in #{time * 1000}ms"
  end
end

MullItOver.new.print
