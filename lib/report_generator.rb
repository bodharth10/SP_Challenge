class ReportGenerator
  def initialize(logs)
    @logs = logs 
  end

  def most_views
    @most_views = {}
    sorted_logs
    @most_views = sorted_logs.transform_values do |value| value.size end
    print_report(sorted_logs, flag: false)
    return @most_views
  end

  def uniq_views
    @uniq_views = {}
    sorted_logs
    @uniq_views = sorted_logs.transform_values do |value| value.uniq.size end
    print_report(sorted_logs, flag: true)
    return @uniq_views
  end

  private

    def sorted_logs
      ((@logs.sort_by { |_key, value| value.size }).reverse!).to_h
    end

    def print_report(views, flag:)
      flag ? (views.each { |key, value| puts "#{key.ljust(10)}: #{value.uniq.size.to_s.ljust(3)}" "uniq views" }) : (views.each { |key, value| puts "#{key.ljust(10)}: #{value.size.to_s.ljust(3)}" "page visits" })
    end
end