describe 'run' do

  subject {MemoCreater.new.run}

  before do
    allow(StdOut).to receive(:print).and_return('') 
  end

  let(:file_data) {
    file_data = []
    File.open(MemoFile.new.file_path) do |file|
      file.each_line do |line|
        file_data.push(line)
      end
    end
    return file_data
  }

  context 'valid' do
    after do
      File.delete(MemoFile.new.file_path)
    end

    it 'create new file with memo' do
      allow(StdIn).to receive(:gets).and_return("10") 
      subject
      expect(file_data).to include "10\n"
    end

    it 'append memo to exist file' do
      allow(StdIn).to receive(:gets).and_return("10") 
      MemoCreater.new.run
      allow(StdIn).to receive(:gets).and_return("11") 
      MemoCreater.new.run
      expect(file_data).to include "10\n"
      expect(file_data).to include "11\n"
    end
  end

  context 'invalid' do
    it 'validate error when input not number' do
      allow(StdIn).to receive(:gets).and_return('ten') 
      expect(subject).to eq '>invalid input: not a number.'
    end
    it 'validate error when input gt 100' do
      allow(StdIn).to receive(:gets).and_return('101') 
      expect(subject).to eq '>invalid input: less than 100.'
    end
  end

end