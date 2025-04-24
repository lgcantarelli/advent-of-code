class Report
  module LevelsSafety
    def safe?
      return true unless problematic_levels?(@levels)
      safe_dampening_one_problematic_level?
    end

    private

      def safe_dampening_one_problematic_level?
        @levels.each_with_index do |_, index|
          levels = @levels.dup
          levels.delete_at(index)

          return true unless problematic_levels?(levels)
        end

        false
      end

      def problematic_levels?(levels)
        (!increasing_levels?(levels) && !decreasing_levels?(levels)) || outlier_level_found?(levels)
      end

      def increasing_levels?(levels)
        levels.sort == levels
      end

      def decreasing_levels?(levels)
        descending_sorted_levels = levels.sort_by { |level| -level }
        descending_sorted_levels == levels
      end

      def outlier_level_found?(levels)
        outlier_found = false

        levels.each_with_index do |level, index|
          next_level = levels[index + 1]

          if next_level
            level_difference = (level - next_level).abs
            outlier_found = level_difference == 0 || level_difference > 3

            break if outlier_found
          end
        end

        outlier_found
      end
  end
end
