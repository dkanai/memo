class ScoreReader

  def initialize(formatter)
    @formatter = formatter
  end

  def run
    ScoreOperatorResult.new(
      'normal',
      @formatter.exec(ScoreFile.read_with_index)
    )
  end

end