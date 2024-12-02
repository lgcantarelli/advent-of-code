require_relative 'locations'
require_relative 'location_pair'
require_relative 'similarity_score'

class HistorianHisterya
  def initialize
   @locations = Locations.new
  end

  def result
    total_distance = LocationPair.total_distance(@locations)
    similarity_score = SimilarityScore.new(@locations).calculate

    { total_distance:, similarity_score: }
  end
end

p HistorianHisterya.new.result
