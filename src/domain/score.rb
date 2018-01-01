class Score

  attr_accessor :index, :score, :person, :validator

  def initialize(score = nil, index = nil, person = nil)
    @index = index
    @score = score
    @person = person
    @validator = ValidatorExecutor.new([
      NumericValidator.new,
      LessThanValidator.new(100),
    ])
  end

  def save
    return false if validator.set_value(score).invalid?
    Scores.new.file.append("#{person.chomp},#{score}")
    true
  end


  def with_index
    "#{to_s}\n"
  end

  def p_tag
    "<p>#{to_s}</p>\n"
  end

  def set_person_from_stdin
    StdOut.print('Please enter the person')
    self.person = StdIn.gets
    self
  end

  def set_score_from_stdin
    StdOut.print('Please enter the score')
    self.score = StdIn.gets
    self
  end
  
  private 

  def to_s
    "#{index}.#{person},#{score.chomp}"
  end

end