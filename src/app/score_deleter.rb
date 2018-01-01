class ScoreDeleter

  def run
    StdOut.print('Please enter delete line number')
    ScoreFile.delete(StdIn.gets)
    ScoreOperaterResult.new("Successfully deleted score")
  end

end