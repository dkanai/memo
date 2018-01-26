class Score

  attr_accessor :index, :score, :validator

  def initialize(score = nil, index = nil)
    @index = index
    @score = score
    @validator = ValidatorExecutor.new([
      NumericValidator.new,
      LessThanValidator.new(100),
    ])
  end

  def save
    return false if validator.set_value(score).invalid?
    Scores.new.db.create(score)
    true
  end

  def to_s
    "#{index}.#{score.chomp}"
  end

  def to_s_with_newline
    "#{to_s}\n"
  end

  def p_tag
    "<p>#{to_s}</p>\n"
  end

  def set_score_from_stdin
    set_to('score') {|std_in| self.score = std_in}
  end

  private 

  def set_to(attribute_name)
    StdOut.print("Please enter the #{attribute_name}")
    yield(StdIn.gets)
    self
  end

end