class ScoreReader

  def run
    StdOut.print('Show all score')
    ScoreOperaterResult.new(ScoreFile.read_with_index)
  end

end