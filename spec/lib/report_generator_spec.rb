require './lib/server_log_parser'
require './lib/log_file_parser'
require './lib/report_generator'

RSpec.describe ReportGenerator do
  let(:file_path) { './spec/fixtures/test_webserver.log' }
  let (:logs) { LogFileParser.new(file_path).parse_file }

  subject { ReportGenerator.new(logs) }

  describe '#sorted_logs' do
    let(:expected_results) do
      {"/contact"=>["543.910.244.929", "555.576.836.194", "200.017.277.774", "316.433.849.805", "836.973.694.403"],
       "/about"=>["126.318.035.038", "235.313.352.950", "836.973.694.403", "929.398.951.889"],
       "/about/2"=>["444.701.448.104", "836.973.694.403", "184.123.665.067", "382.335.626.855"],
       "/home"=>["444.701.448.104", "336.284.013.698", "444.701.448.104"],
       "/help_page/1"=>["929.398.951.889", "929.398.951.889", "836.973.694.403"],
       "/index"=>["316.433.849.805", "802.683.925.780", "929.398.951.889"]
      }
    end

    it 'returns the correct values for sorted_logs' do
      expect(subject.instance_eval('sorted_logs')).to eq(expected_results)
    end
  end

  describe '#most_views' do
    before { subject.instance_eval('sorted_logs') }

    let(:expected_results) do
      {"/about/2"=>90, "/contact"=>89, "/index"=>82, "/about"=>81, "/help_page/1"=>80, "/home"=>78}
    end

    it 'returns the most visits' do
      expect(subject.uniq_views).eql?(expected_results)
    end
  end

  describe '#unique_views' do
    before { subject.instance_eval('sorted_logs') }

    let(:expected_results) do
      {"/about/2"=>22, "/contact"=>23, "/index"=>23, "/about"=>21, "/help_page/1"=>23, "/home"=>23}
    end

    it 'returns the uniq visits' do
      expect(subject.uniq_views).eql?(expected_results)
    end
  end
end    