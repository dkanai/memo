class ScoreCreater

  def run
    score = Score.new
                 .set_person_from_stdin
                 .set_score_from_stdin
    if score.save
      ScoreOperatorResult.new('success', 'Successfully created score')
    else
      ScoreOperatorResult.new('error', score.validator.errors.join(''))
    end
  end

end