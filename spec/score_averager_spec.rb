describe 'run' do

  subject {ScoreAverager.new.run}

  before do
    File.delete(ScoreFile.file_path) if File.exist?(ScoreFile.file_path)
    allow(StdOut).to receive(:print).and_return('') 
    ScoreFile.append("54")
    ScoreFile.append("67")
    ScoreFile.append("68")
    ScoreFile.append("99")
    ScoreFile.append("3")
    ScoreFile.append("1")
  end

  it 'read file memo with line number' do
    expect(subject).to include "48.7"
  end

end