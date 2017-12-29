describe 'run' do

  before do
    File.delete(ScoreFile.new.file_path) if File.exist?(ScoreFile.new.file_path)
    allow(StdOut).to receive(:print).and_return('') 
    ScoreFile.new.append("memo")
    ScoreFile.new.append("memo2")
  end

  subject {ScoreDeleter.new.run}

  let(:file_data) {
    file_data = []
    File.open(ScoreFile.new.file_path) do |file|
      file.each_line do |line|
        file_data.push(line)
      end
    end
    return file_data
  }

  it 'delete file line' do
    allow(StdIn).to receive(:gets).and_return("1\n") 
    subject
    expect(file_data).not_to include "memo\n"
  end

end