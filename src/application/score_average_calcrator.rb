class ScoreAverageCalculator

  def run
    ScoreOperatorResult.new('normal', "Score Average: #{Scores.new.average}")
  end

  private 

end
