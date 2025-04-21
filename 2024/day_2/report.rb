require_relative 'report/parseable'

class Report
  include Parseable

  attr_accessor :levels

  def initialize(levels:)
    @levels = levels
  end

  def safe?
    (increasing_levels? || decreasing_levels?) && no_outlier_level?
  end

  private

    def increasing_levels?
      decreasing_levels_found = false

      @levels.each_with_index do |level, index|
        next_level = @levels[index + 1]

        if next_level
          decreasing_levels_found = level > next_level
          break if decreasing_levels_found
        end
      end

      !decreasing_levels_found
    end

    def decreasing_levels?
      increasing_levels_found = false

      @levels.each_with_index do |level, index|
        next_level = @levels[index + 1]

        if next_level
          increasing_levels_found = level < next_level
          break if increasing_levels_found
        end
      end

      !increasing_levels_found
    end

    def no_outlier_level?
      outlier_found = false

      @levels.each_with_index do |level, index|
        next_level = @levels[index + 1]

        if next_level
          level_difference = (level - next_level).abs
          outlier_found = level_difference == 0 || level_difference > 3

          break if outlier_found
        end
      end

      !outlier_found
    end
end
