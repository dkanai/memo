class ScoreDeleter

  def run
    StdOut.print('Please enter delete line number')
    Scores.new.db.delete(StdIn.gets)
    ScoreOperatorResult.new('Successfully deleted score')
  end

end