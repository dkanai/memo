describe 'run' do

  subject {Memo.new(@operation).run}
  it do
    @operation = 1
    expect(subject).to eq 'create'
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