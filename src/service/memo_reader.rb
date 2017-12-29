class MemoReader

  def run
    puts ">Show all score.\n"
    MemoFile.new.read_with_index
  end

end