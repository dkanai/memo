class ScoreReader

  def run
    StdOut.print(">Show all score.\n")
    ScoreFile.read_with_index
  end

end