class ScoreReader

  def initialize
    @formatter = ScoreTextFormatter.new
  end

  def run
    ScoreOperatorResult.new(
      'normal',
      @formatter.exec(ScoreFile.read_with_index)
    )
  end

end