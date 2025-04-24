class MullItOver
  def initialize
    @memory = Computer.load_memory
    @computer = Computer.new(@memory)
  end

  def print
    init = Time.now
    p "Multiplications added up: #{@computer.calculate}"

    time = Time.now - init
    p "Executed in #{time * 1000}ms"
  end
end
