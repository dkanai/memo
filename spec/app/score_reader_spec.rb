describe 'run' do

  before do
    File.delete(ScoreFile.file_path) if File.exist?(ScoreFile.file_path)
    allow(StdOut).to receive(:print).and_return('') 
    ScoreFile.append("10")
    ScoreFile.append("20")
  end

  subject {ScoreReader.new.run}

  it 'read file memo with line number' do
    expect(subject.msg).to include "1.10\n"
    expect(subject.msg).to include "2.20\n"
    expect(subject.msg.class).to eq String
  end

end
