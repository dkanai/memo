describe 'run' do


  subject {Memo.new(@operation).run}
  it do
    @operation = 1
    allow(StdIn).to receive(:gets).and_return('create') 
    expect(subject).to eq 'create'
    File.delete(MemoFile.new.file_path)
  end
  it do
    @operation = 2
    expect(subject).to eq 'read'
  end
  it do
    @operation = 3
    expect(subject).to eq 'delete'
  end
end