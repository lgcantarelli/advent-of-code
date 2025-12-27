class Sequence
  def initialize
    @sequence = parse_sequence
  end

  def each
    @sequence.each do |rotation|
      yield rotation
    end
  end

  private

    def parse_sequence
      [].tap do |parsed_sequence|
        File.readlines('sequence.txt').each do |rotation|
          direction = rotation[0]
          size = rotation.split(direction)[1].strip.to_i

          parsed_sequence << [direction, size]
        end
      end
    end
end