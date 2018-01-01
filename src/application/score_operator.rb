class ScoreOperator

  attr_accessor :result

  def initialize(operation)
    @operation = operation
  end

  def run
    @result = {
      'create' =>       ScoreCreater.new,
      'read' =>         ScoreReader.new(ScoreTextFormatter.new),
      'read_as_html' => ScoreReader.new(ScoreHtmlFormatter.new),
      'delete' =>       ScoreDeleter.new,
      'average' =>      ScoreAverageCalculator.new,
    }[@operation].run
    self
  end

  def print
    StdOut.print(result.msg, result.color)
  end

end