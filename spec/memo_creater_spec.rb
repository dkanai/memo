describe 'run' do

  after do
    File.delete(MemoFile.new.file_path)
  end

  subject {MemoCreater.new.run}

  let(:file_data) {
    file_data = []
    File.open(MemoFile.new.file_path) do |file|
      file.each_line do |line|
        file_data.push(line)
      end
    end
    return file_data
  }

  it 'create new file with memo' do
    allow(StdIn).to receive(:gets).and_return('memo') 
    subject
    expect(file_data).to include "memo\n"
  end

  it 'append memo to exist file' do
    allow(StdIn).to receive(:gets).and_return('memo') 
    MemoCreater.new.run
    allow(StdIn).to receive(:gets).and_return('memo2') 
    MemoCreater.new.run
    expect(file_data).to include "memo\n"
    expect(file_data).to include "memo2\n"
  end
end