class MemoCreater

  def run
    StdOut.print(">Please enter the score.\n")
    input = StdIn.gets
    if (input =~ /^[0-9]+$/) != 0
      return '>invalid input: not a number.'
    end
    if input.to_i > 100
      return '>invalid input: grater than 100.'
    end
    MemoFile.new.append(input)
    ">Successfully created score\n"
  end

end