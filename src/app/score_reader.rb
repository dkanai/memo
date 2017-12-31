class ScoreReader

  def run
    StdOut.print('Show all score')
    ScoreFile.read_with_index
  end

end