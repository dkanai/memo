class ScoreDeleter

  def run
    StdOut.print('Please enter delete line number')
    Scores.new.file.delete_line(StdIn.gets)
    ScoreOperatorResult.new('success', 'Successfully deleted score')
  end

end