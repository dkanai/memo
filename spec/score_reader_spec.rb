describe 'run' do

  before do
    File.delete(ScoreFile.new.file_path) if File.exist?(ScoreFile.new.file_path)
    allow(StdOut).to receive(:print).and_return('') 
    ScoreFile.new.append("memo")
    ScoreFile.new.append("memo2")
  end

  subject {ScoreReader.new.run}

  it 'read file memo with line number' do
    expect(subject).to include "1.memo\n"
    expect(subject).to include "2.memo2\n"
  end

end
