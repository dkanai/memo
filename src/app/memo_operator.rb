class MemoOperator

  def initialize(operation)
    @operation = operation
  end

  def run
    {
      1 => MemoCreater.new,
      2 => MemoReader.new,
      3 => MemoDeleter.new,
    }[@operation].run
  end

end