class MemoCreater

  def run
    memo = StdIn.gets
    MemoFile.new.append(memo)
    'create'
  end

end