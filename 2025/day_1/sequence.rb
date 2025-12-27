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
          distance = rotation.split(direction)[1].strip.to_i

          parsed_sequence << [direction, distance]
        end
      end
    end
end