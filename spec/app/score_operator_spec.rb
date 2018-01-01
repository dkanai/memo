describe 'run' do

  before do
    File.delete(ScoreFile.file_path) if File.exist?(ScoreFile.file_path)
    ScoreFile.append("100")
    ScoreFile.append("0")
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
    File.delete(ScoreFile.file_path) if File.exist?(ScoreFile.file_path)
    ScoreFile.append("100")
  end

  subject {ScoreOperator.new(@operation).run.print}

  it 'got success color' do
    @operation = 'create'
    allow(StdIn).to receive(:gets).and_return('10') 
    expect {subject}.to output(/32m/).to_stdout
  end

  it 'got error color' do
    @operation = 'create'
    allow(StdIn).to receive(:gets).and_return('a') 
    expect {subject}.to output(/31m/).to_stdout
  end

  it 'got read color' do
    @operation = 'read'
    expect {subject}.to output(/37m/).to_stdout
  end

end