describe 'run' do

  before do
    File.delete(ScoreFile.new.file_path) if File.exist?(ScoreFile.new.file_path)
    ScoreFile.new.append("100")
    allow(StdOut).to receive(:print).and_return('') 
  end

  subject {ScoreOperator.factory(@operation).run}

  it do
    @operation = 1
    allow(StdIn).to receive(:gets).and_return('10') 
    expect(subject).to eq ">Successfully created score\n"
  end
  it do
    @operation = 2
    expect(subject).to include "1.100\n"
  end
  it do
    allow(StdIn).to receive(:gets).and_return('1') 
    @operation = 3
    expect(subject).to eq ">Successfully deleted score\n"
  end
  it do
    ScoreFile.new.append("0")
    @operation = 4
    expect(subject).to eq ">Score Average: 50.0"
  end
end