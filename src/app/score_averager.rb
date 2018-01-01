class ScoreAverager

  def run
    ScoreOperatorResult.new('normal', "Score Average: #{score_average}")
  end

  private 

  def score_average
    ScoreFile.read.map(&:chomp).map(&:to_i).average
  end

end
