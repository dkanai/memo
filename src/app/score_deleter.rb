class ScoreDeleter

  def run
    StdOut.print(">Please enter delete line number.\n")
    ScoreFile.delete(StdIn.gets)
    ">Successfully deleted score\n"
  end

end