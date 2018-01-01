class ScoreAverager

  def run
    ScoreOperaterResult.new("Score Average: #{score_average}")
  end

  def score_average
    ScoreFile.read.map(&:chomp).map(&:to_i).average
  end

end
