class ScoreFileLine

  attr_accessor :index, :score, :validator

  def initialize(score, index = nil)
    @index = index
    @score = score
    @validator = ValidatorExecutor.new([
      NumericValidator.new,
      LessThanValidator.new(100),
    ])
  end

  def save
    return false if validator.set_value(score).invalid?
    Scores.new.file.append(score)
    true
  end

  def score_with_index
    "#{index}.#{score}"
  end

  def score_with_p_tag
    "<p>#{index}.#{score.chomp}</p>\n"
  end

end