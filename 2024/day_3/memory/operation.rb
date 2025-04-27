require_relative '../operation'

class Memory
  module Operation
    def operations
      @data.scan(/mul\([0-999]{1,3},[0-999]{1,3}\)/).map do |token|
        operand = token.match(/[a-z]{3}/).to_s
        a, b = token.scan(/[0-999]{1,3}/)

        ::Operation.new(operand:, a:, b:)
      end
    end
  end
end
