require_relative 'report/parseable'
require_relative 'report/levels_safety'

class Report
  include Parseable, LevelsSafety

  def initialize(levels:)
    @levels = levels
  end
end
