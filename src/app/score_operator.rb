class ScoreOperator

  attr_accessor :result

  def initialize(operation)
    @operation = operation
  end

  def run
    @result = {
      1 => ScoreCreater.new,
      2 => ScoreReader.new,
      3 => ScoreDeleter.new,
      4 => ScoreAverager.new,
    }[@operation].run
    self
  end

  def print
    StdOut.print(@result.msg)
  end

end