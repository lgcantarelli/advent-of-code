class Operation
  def initialize(operand:, a:, b:)
    @operand = operand
    @a = a
    @b = b
  end

  def evaluate
    @a.to_i * @b.to_i if @operand == 'mul'
  end
end
