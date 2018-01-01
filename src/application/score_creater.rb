class ScoreCreater

  def run
    StdOut.print('Please enter the score')
    score_file_line = ScoreFileLine.new(StdIn.gets)
    return ScoreOperatorResult.new('error', score_file_line.validator.errors.join('')) if score_file_line.validator.set_value(score_file_line.score).invalid?
    score_file_line.save
    ScoreOperatorResult.new('success', 'Successfully created score')
  end

end