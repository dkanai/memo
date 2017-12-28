class MemoDeleter

  def run
    MemoFile.new.delete(StdIn.gets)
    'delete'
  end

end