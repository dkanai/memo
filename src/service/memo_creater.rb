class MemoCreater

  def run
    StdOut.print(">Please enter the score.\n")
    input = StdIn.gets
    if !MemoValidator.new(input).numeric?
      return '>invalid input: not a number.'
    end
    if MemoValidator.new(input).gt100?
      return '>invalid input: grater than 100.'
    end
    MemoFile.new.append(input)
    ">Successfully created score\n"
  end

end