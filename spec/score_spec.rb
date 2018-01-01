describe 'run' do

  before do
    File.delete(ScoreFile.file_path) if File.exist?(ScoreFile.file_path)
    ScoreFile.append("100")
    allow(StdOut).to receive(:print).and_return('') 
  end

  subject {ScoreOperator.factory(@operation).run}

  it do
    @operation = 1
    allow(StdIn).to receive(:gets).and_return('10') 
    expect(subject).to eq 'Successfully created score'
  end
  it do
    @operation = 2
    expect(subject).to include "1.100\n"
  end
  it do
    allow(StdIn).to receive(:gets).and_return('1') 
    @operation = 3
    expect(subject).to eq 'Successfully deleted score'
  end
  it do
    ScoreFile.append("0")
    @operation = 4
    expect(subject).to eq 'Score Average: 50.0'
  end
end