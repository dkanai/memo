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
    return false if validator.set_value(score).invalid?
    Scores.append(score)
    true
  end

end