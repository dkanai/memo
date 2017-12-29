class ScoreOperator

  def initialize(operation)
    @operation = operation
  end

  def run
    {
      1 => ScoreCreater.new,
      2 => ScoreReader.new,
      3 => ScoreDeleter.new,
      4 => ScoreAverager.new,
    }[@operation].run
  end

end