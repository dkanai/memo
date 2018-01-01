describe 'run' do

  before do
    File.delete(ScoreFile.file_path) if File.exist?(ScoreFile.file_path)
    ScoreFile.append("100")
    allow(StdOut).to receive(:print).and_return('') 
  end

  subject {ScoreOperator.new(@operation).run.result.msg}

  [
    [1, 'Successfully created score'],
    [2, "1.100\n"],
    [3, 'Successfully deleted score'],
    [4, 'Score Average: 50.0'],
  ].each do |operation, msg|
    it "got '#{msg}' when run opration '#{operation}'" do
      ScoreFile.append("0")
      @operation = operation
      allow(StdIn).to receive(:gets).and_return('10') 
      expect(subject).to include msg
    end
  end

end
