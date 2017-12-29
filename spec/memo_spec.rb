describe 'run' do

  before do
    MemoFile.new.append("100")
    allow(StdOut).to receive(:print).and_return('') 
  end

  after do
    File.delete(MemoFile.new.file_path)
  end

  subject {MemoOperator.new(@operation).run}
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
    @operation = 4
    expect(subject).to eq ">Score Average: 50"
  end
end