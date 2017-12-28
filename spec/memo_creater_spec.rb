describe 'run' do

  after do
    File.delete(MemoFile.new.file_path)
  end

  subject {MemoCreater.new.run}

  it do
    allow(StdIn).to receive(:gets).and_return('memo') 
    subject
    File.open(MemoFile.new.file_path) do |file|
      file.each_line do |line|
        expect(line).to eq 'memo'
      end
    end
  end
end