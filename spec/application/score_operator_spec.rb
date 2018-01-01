describe 'run' do

  before do
    File.delete(Scores.new.file.file_path) if File.exist?(Scores.new.file.file_path)
    Scores.new.file.append("kanai,100")
    Scores.new.file.append("kanai,0")
    allow_any_instance_of(Score).to receive(:set_person_from_stdin).and_return(Score.new("10", nil, "kanai")) 
    allow_any_instance_of(Score).to receive(:set_score_from_stdin).and_return(Score.new("10", nil, "kanai")) 
    allow(StdIn).to receive(:gets).and_return('10') 
    allow(StdOut).to receive(:print).and_return('') 
  end

  subject {ScoreOperator.new(@operation).run.result}

  [
    ['create', 'Successfully created score', 'success'],
    ['read', "1.100\n", 'normal'],
    ['read_as_html', "<h2>Show all score</h2>", 'normal'],
    ['delete', 'Successfully deleted score', 'success'],
    ['average', 'Score Average: 50.0', 'normal'],
  ].each do |operation, msg, status|
    it "got '#{msg}' when run opration '#{operation}'" do
      @operation = operation
      expect(subject.msg).to include msg
      expect(subject.status).to eq status
    end
  end

end

describe 'print' do

  before do
    File.delete(Scores.new.file.file_path) if File.exist?(Scores.new.file.file_path)
    Scores.new.file.append("kanai,100")
  end

  subject {ScoreOperator.new(@operation).run.print}

  it 'got success color' do
    @operation = 'create'
    allow_any_instance_of(Score).to receive(:set_person_from_stdin).and_return(Score.new("10", nil, "kanai")) 
    allow_any_instance_of(Score).to receive(:set_score_from_stdin).and_return(Score.new("10", nil, "kanai")) 
    expect {subject}.to output(/32m/).to_stdout
  end

  it 'got error color' do
    @operation = 'create'
    allow_any_instance_of(Score).to receive(:set_person_from_stdin).and_return(Score.new("10", nil, "kanai")) 
    allow_any_instance_of(Score).to receive(:set_score_from_stdin).and_return(Score.new("a", nil, "kanai")) 
    expect {subject}.to output(/31m/).to_stdout
  end

  it 'got read color' do
    @operation = 'read'
    expect {subject}.to output(/37m/).to_stdout
  end

end