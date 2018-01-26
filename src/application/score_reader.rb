class ScoreReader

  def initialize(formatter)
    @formatter = formatter
  end

  def run
    ScoreOperatorResult.new(@formatter.exec(Scores.new.all))
  end

end