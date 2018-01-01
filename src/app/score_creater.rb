class ScoreCreater

  def initialize
    @validator = ValidatorExecutor.new([
      NumericValidator.new,
      LessThanValidator.new(100),
    ])
  end

  def run
    StdOut.print('Please enter the score')
    input = StdIn.gets
    return @validator.errors.join('') if @validator.set_value(input).invalid?
    ScoreFile.append(input)
    ScoreOperatorResult.new('Successfully created score')
  end

end