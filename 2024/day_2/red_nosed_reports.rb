require_relative 'report'

class RedNosedReports
  def initialize
    @reports = Report.parse_and_load
  end

  def safe_reports_count
    count = 0
    @reports.each do |report|
      count += 1 if report.safe?
    end

    count
  end

  def print
    p "Safe Reports Count: #{safe_reports_count}"
  end
end

RedNosedReports.new.print
