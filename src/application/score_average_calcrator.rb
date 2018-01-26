class ScoreAverageCalculator

  def run
    ScoreOperatorResult.new("Score Average: #{Scores.new.average}")
  end

end
