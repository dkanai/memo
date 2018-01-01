describe 'run' do

  subject {ScoreCreater.new.run}

  before do
    allow(StdOut).to receive(:print).and_return('') 
  end

  let(:file_data) {
    File.foreach(Scores.new.file.path).map {|line| line}
  }

  context 'valid' do
    before do
      File.delete(Scores.new.file.path) if File.exist?(Scores.new.file.path)
    end

    it 'create new file' do
      allow_any_instance_of(Score).to receive(:set_person_from_stdin).and_return(Score.new("10", nil, "kanai")) 
      allow_any_instance_of(Score).to receive(:set_score_from_stdin).and_return(Score.new("10", nil, "kanai")) 
      expect(subject.status).to eq 'success'
      expect(file_data.count).to eq 1
      expect(file_data.to_s).to include "10"
      expect(file_data.to_s).to include "kanai"
    end

    it 'append score to exist file' do
      allow_any_instance_of(Score).to receive(:set_person_from_stdin).and_return(Score.new("10", nil, "kanai")) 
      allow_any_instance_of(Score).to receive(:set_score_from_stdin).and_return(Score.new("10", nil, "kanai")) 
      ScoreCreater.new.run
      allow_any_instance_of(Score).to receive(:set_score_from_stdin).and_return(Score.new("100", nil, "kanai")) 
      ScoreCreater.new.run
      expect(file_data.to_s).to include "10"
      expect(file_data.to_s).to include "100"
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