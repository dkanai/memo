class MemoCreater

  def initialize
    @validator = MemoValidator.new
  end

  def run
    StdOut.print(">Please enter the score.\n")
    input = StdIn.gets
    if !@validator.setValue(input).numeric?
      return '>invalid input: not a number.'
    end
    if @validator.setValue(input).gt100?
      return '>invalid input: grater than 100.'
    end
    MemoFile.new.append(input)
    ">Successfully created score\n"
  end

end