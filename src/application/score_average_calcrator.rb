class ScoreAverageCalculator

  def run
    ScoreOperatorResult.new('normal', "Score Average: #{ScoreFile.average}")
  end

  private 

end
