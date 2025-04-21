class Report
  module LevelsSafety
    def safe?
      (increasing_levels? || decreasing_levels?) && !outlier_level_found?
    end

    private

      def increasing_levels?
        @levels.sort == @levels
      end

      def decreasing_levels?
        descending_sorted_levels = @levels.sort_by { |level| -level }
        descending_sorted_levels == @levels
      end

      def outlier_level_found?
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
end
