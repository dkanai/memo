describe 'run' do

  subject {ScoreCreater.new.run}

  before do
    allow(StdOut).to receive(:print).and_return('') 
  end

  let(:file_data) {
    file_data = []
    File.open(ScoreFile.file_path) do |file|
      file.each_line do |line|
        file_data.push(line)
      end
    end
    return file_data
  }

  context 'valid' do
    before do
      File.delete(ScoreFile.file_path) if File.exist?(ScoreFile.file_path)
    end

    it 'create new file with memo' do
      allow(StdIn).to receive(:gets).and_return("10") 
      subject
      expect(file_data).to include "10\n"
    end

    it 'append memo to exist file' do
      allow(StdIn).to receive(:gets).and_return('10') 
      ScoreCreater.new.run
      allow(StdIn).to receive(:gets).and_return('100') 
      ScoreCreater.new.run
      expect(file_data).to include "10\n"
      expect(file_data).to include "100\n"
    end
  end

  context 'invalid' do
    it 'validate error when input not number' do
      allow(StdIn).to receive(:gets).and_return('ten') 
      expect(subject.msg).to eq 'invalid input: not a number'
      expect(subject.status).to eq 'error'
    end
    it 'validate error when input gt 100' do
      allow(StdIn).to receive(:gets).and_return('101') 
      expect(subject.msg).to eq 'invalid input: less than 100'
    end
  end

end