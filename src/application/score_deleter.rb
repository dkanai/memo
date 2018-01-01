class ScoreDeleter

  def run
    StdOut.print('Please enter delete line number')
    Scores.delete(StdIn.gets)
    ScoreOperatorResult.new('success', "Successfully deleted score")
  end

end