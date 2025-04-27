require_relative 'memory/operation'

class Memory
  include Operation

  def initialize
    @data = self.class.load
  end

  def self.load
    File.read('memory.txt')
  end
end
