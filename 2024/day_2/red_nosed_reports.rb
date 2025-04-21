require_relative 'report'

class RedNosedReports
  def initialize
    @reports = Report.parse_and_load
  end

  def print
    init = Time.now
    p "Safe Reports Count: #{safe_reports_count}"

    time = Time.now - init
    p "Executed in #{time * 1000}ms"
  end

  private

  def safe_reports_count
    count = 0
    @reports.each do |report|
      count += 1 if report.safe?
    end

    count
  end
end

RedNosedReports.new.print
