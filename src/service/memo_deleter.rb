class MemoDeleter

  def run
    puts ">Please enter delete line number.\n"
    MemoFile.new.delete(StdIn.gets)
    ">Successfully deleted score\n"
  end

end