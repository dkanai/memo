describe 'run' do

  subject {ScoreAverager.new.run}

  before do
    File.delete(ScoreFile.new.file_path) if File.exist?(ScoreFile.new.file_path)
    allow(StdOut).to receive(:print).and_return('') 
    ScoreFile.new.append("54")
    ScoreFile.new.append("67")
    ScoreFile.new.append("68")
    ScoreFile.new.append("99")
    ScoreFile.new.append("3")
    ScoreFile.new.append("1")
  end

  it 'read file memo with line number' do
    expect(subject).to include "48.7"
  end

end