class ScoreOperator

  def self.factory(operation)
    {
      1 => ScoreCreater.new,
      2 => ScoreReader.new,
      3 => ScoreDeleter.new,
      4 => ScoreAverager.new,
    }[operation]
  end

end