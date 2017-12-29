describe 'run' do

  subject {MemoAverager.new.run}

  before do
    allow(StdOut).to receive(:print).and_return('') 
    MemoFile.new.append("54")
    MemoFile.new.append("67")
    MemoFile.new.append("68")
    MemoFile.new.append("99")
    MemoFile.new.append("3")
    MemoFile.new.append("1")
  end

  after do
    File.delete(MemoFile.new.file_path)
  end

  it 'read file memo with line number' do
    expect(subject).to include "48.7"
  end

end