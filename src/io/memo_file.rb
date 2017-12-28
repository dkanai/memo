class MemoFile
  def file_path
    'data/memo.txt'
  end

  def append(memo)
    File.open(file_path, 'a') { |f| f.write(memo) }
  end

end