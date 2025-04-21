class Report
  module Parseable
    module ClassMethods
      def parse_and_load(file_name = nil)
        [].tap do |reports|
          File.readlines(file_name || 'reports.txt').each do |levels|
            reports << Report.new(levels: levels.split.map(&:to_i))
          end
        end
      end
    end

    def self.included(base)
      base.extend(ClassMethods)
    end
  end
end
