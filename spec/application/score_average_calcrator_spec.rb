describe 'run' do

  subject {ScoreAverageCalculator.new.run}

  before do
    File.delete(Scores.new.file.path) if File.exist?(Scores.new.file.path)
    allow(StdOut).to receive(:print).and_return('') 
    Scores.new.file
          .append("nil,54")
          .append("nil,67")
          .append("nil,68")
          .append("nil,99")
          .append("nil,3")
          .append("nil,1")
  end

  it 'read file memo with line number' do
    expect(subject.msg).to include "48.7"
  end

end