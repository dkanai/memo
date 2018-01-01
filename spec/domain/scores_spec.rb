describe 'read' do

  before do
    File.delete(Scores.new.file.path) if File.exist?(Scores.new.file.path)
    Scores.new.file.append("kanai,100")
  end

  subject{Scores.new.read}

  it 'read' do
    expect(subject[0].person).to eq 'kanai'
    expect(subject[0].score).to eq '100'
  end

end