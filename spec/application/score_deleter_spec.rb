describe 'run' do

  before do
    File.delete(Scores.new.db.path) if File.exist?(Scores.new.db.path)
    allow(StdOut).to receive(:print).and_return('') 
    Scores.new.db
          .create("nil,10")
          .create("nil,20")
  end

  subject {ScoreDeleter.new.run}

  let(:file_data) {
    file_data = []
    File.open(Scores.new.db.path) do |file|
      file.each_line do |line|
        file_data.push(line)
      end
    end
    return file_data
  }

  it 'delete file line' do
    allow(StdIn).to receive(:gets).and_return("1\n") 
    subject
    expect(file_data).not_to include "10\n"
  end

end