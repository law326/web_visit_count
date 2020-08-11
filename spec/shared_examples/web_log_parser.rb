# frozen_string_literal: true

RSpec.shared_examples 'prepare logs to DB' do |number_of_logs|
  it 'clears old logs' do
    create(:web_log, visited_url: '/url/2', from_ip: '1.2.3.0')
    create(:web_log, visited_url: '/url/3', from_ip: '1.2.3.1')
    create(:web_log, visited_url: '/url/3', from_ip: '1.2.3.2')
    subject.send(:clear_all_logs)
    expect(WebLog.count).to eq(0)
  end

  it 'imports logs to DB' do
    subject.run
    expect(WebLog.count).to eq(number_of_logs)
    expect(WebLog.all.all? { |log| log.visited_url.present? }).to eq(true)
    expect(WebLog.all.all? { |log| log.from_ip.present? }).to eq(true)
  end
end
