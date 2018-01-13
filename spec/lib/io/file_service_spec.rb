
describe '#create' do
  subject {FileService.new('data/test_score.txt').create('something')}
  it 'return be self' do
    expect(subject).to be_a FileService
  end
end