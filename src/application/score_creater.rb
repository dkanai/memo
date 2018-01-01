class ScoreCreater

  def run
    StdOut.print('Please enter the score')
    score = Score.new(StdIn.gets)
    if score.save
      ScoreOperatorResult.new('success', 'Successfully created score')
    else
      ScoreOperatorResult.new('error', score.validator.errors.join(''))
    end
  end

end