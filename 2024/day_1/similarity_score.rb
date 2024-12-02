class SimilarityScore
  def initialize(locations)
    @locations = locations
  end

  def calculate
    @locations.first_list.sum { |location_id| calculate_similarity(location_id) }
  end

  private

  def calculate_similarity(location_id)
    appearances_on_second_list(location_id) * location_id
  end

  def appearances_on_second_list(location_id)
    @appearances ||= {}

    @appearances[location_id] ||= begin
      @locations.second_list.count do |other_location_id|
        location_id == other_location_id
      end
    end
  end
end
