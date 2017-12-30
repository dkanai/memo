class ScoreCreater

  def initialize
    @validator = Validator.new([
      NumericValidator.new,
      LessThanValidator.new(100),
    ])
  end

  def run
    StdOut.print(">Please enter the score.\n")
    input = StdIn.gets
    return @validator.errors.join('') if @validator.set_value(input).invalid?
    ScoreFile.append(input)
    ">Successfully created score\n"
  end

end