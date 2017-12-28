class MemoCreater

  def run
    memo = StdIn.gets
    MemoFile.new.append(memo)
    'created memo'
  end

end