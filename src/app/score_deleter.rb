class ScoreDeleter

  def run
    StdOut.print('Please enter delete line number')
    ScoreFile.delete(StdIn.gets)
    ScoreOperatorResult.new("Successfully deleted score")
  end

end