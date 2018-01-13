describe 'read' do

  before do
    File.delete(Scores.new.db.path) if File.exist?(Scores.new.db.path)
    Scores.new.db.create("kanai,100")
  end

  subject{Scores.new.all}

  it 'read' do
    expect(subject[0].person).to eq 'kanai'
    expect(subject[0].score).to eq '100'
  end

end