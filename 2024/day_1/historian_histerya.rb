require_relative 'locations'
require_relative 'location_pair'

class HistorianHisterya
  def initialize
   @locations = Locations.new
  end

  def result
    pairs = LocationPair.build(@locations)
    pairs.map(&:distance).sum
  end
end

p HistorianHisterya.new.result
