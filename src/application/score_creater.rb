class ScoreCreater

  def run
    StdOut.print('Please enter the score')
    score_file_line = Score.new(StdIn.gets)
    if score_file_line.save
      ScoreOperatorResult.new('success', 'Successfully created score')
    else
      ScoreOperatorResult.new('error', score_file_line.validator.errors.join(''))
    end
  end

end