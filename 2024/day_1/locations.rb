class Locations
  attr_reader :first_list, :second_list

  def initialize
    @first_list = []
    @second_list = []

    File.readlines('locations.txt').each do |line|
      first, second = line.split.map(&:to_i)

      @first_list << first
      @second_list << second
    end
  end
end
