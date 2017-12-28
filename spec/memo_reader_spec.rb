describe 'run' do

  before do
    MemoFile.new.append("memo")
    MemoFile.new.append("memo2")
  end

  after do
    File.delete(MemoFile.new.file_path)
  end

  subject {MemoReader.new.run}

  it 'read file memo with line number' do
    expect(subject).to include "1.memo\n"
    expect(subject).to include "2.memo2\n"
  end

end
