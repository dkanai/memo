describe 'run' do

  subject {ScoreAverageCalculator.new.run}

  before do
    File.delete(Scores.new.db.path) if File.exist?(Scores.new.db.path)
    allow(StdOut).to receive(:print).and_return('') 
    Scores.new.db
          .create("nil,54")
          .create("nil,67")
          .create("nil,68")
          .create("nil,99")
          .create("nil,3")
          .create("nil,1")
  end

  it 'read file memo with line number' do
    expect(subject.msg).to include "48.7"
  end

end