describe 'run' do

  subject {ScoreAverageCalculator.new.run}

  before do
    File.delete(Scores.new.file.file_path) if File.exist?(Scores.new.file.file_path)
    allow(StdOut).to receive(:print).and_return('') 
    Scores.new.file.append("54")
    Scores.new.file.append("67")
    Scores.new.file.append("68")
    Scores.new.file.append("99")
    Scores.new.file.append("3")
    Scores.new.file.append("1")
  end

  it 'read file memo with line number' do
    expect(subject.msg).to include "48.7"
  end

end