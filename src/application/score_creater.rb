class ScoreCreater

  def run
    score = Score.new.set_score_from_stdin
    if score.save
      ScoreOperatorResult.new('Successfully created score')
    else
      ScoreOperatorResult.new(score.validator.errors.join(''))
    end
  end

end