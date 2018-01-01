class ScoreFileLine

  attr_accessor :score, :validator

  def initialize(score)
    @score = score
    @validator = ValidatorExecutor.new([
      NumericValidator.new,
      LessThanValidator.new(100),
    ])
  end

  def save
    ScoreFile.append(score)
  end

end
