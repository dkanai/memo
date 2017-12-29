describe 'run' do

  after do
    File.delete(MemoFile.new.file_path)
  end

  before do
    allow(StdOut).to receive(:print).and_return('') 
    MemoFile.new.append("memo")
    MemoFile.new.append("memo2")
  end

  subject {MemoDeleter.new.run}

  let(:file_data) {
    file_data = []
    File.open(MemoFile.new.file_path) do |file|
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