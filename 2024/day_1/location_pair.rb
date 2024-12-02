class LocationPair
  def initialize(location1, location2)
    @location1 = location1
    @location2 = location2
  end

  def self.generate(locations)
    first_list = locations.first_list.sort
    second_list = locations.second_list.sort

    first_list.each_with_index.map do |location1, index|
      location2 = second_list[index]
      new(location1, location2)
    end
  end

  def self.total_distance(locations)
    self.generate(locations).map(&:distance).sum
  end

  def distance
    (@location1 - @location2).abs
  end
end
