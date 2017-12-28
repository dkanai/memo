describe 'run' do

  before do
    MemoFile.new.append("memo")
  end

  after do
    File.delete(MemoFile.new.file_path)
  end

  subject {Memo.new(@operation).run}
  it do
    @operation = 1
    allow(StdIn).to receive(:gets).and_return('create') 
    expect(subject).to eq 'create'
  end
  it do
    @operation = 2
    expect(subject).to include "1.memo\n"
  end
  it do
    @operation = 3
    expect(subject).to eq 'delete'
  end
end