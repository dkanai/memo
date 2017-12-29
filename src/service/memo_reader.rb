class MemoReader

  def run
    StdOut.print(">Show all score.\n")
    MemoFile.new.read_with_index
  end

end