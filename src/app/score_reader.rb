class ScoreReader

  def run
    StdOut.print('Show all score')
    ScoreOperatorResult.new('success', ScoreFile.read_with_index)
  end

end