describe 'run' do

  subject {ScoreAverageCalculator.new.run}

  before do
    File.delete(Scores.file_path) if File.exist?(Scores.file_path)
    allow(StdOut).to receive(:print).and_return('') 
    Scores.append("54")
    Scores.append("67")
    Scores.append("68")
    Scores.append("99")
    Scores.append("3")
    Scores.append("1")
  end

  it 'read file memo with line number' do
    expect(subject.msg).to include "48.7"
  end

end