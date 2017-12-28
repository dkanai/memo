class MemoFile

  def file_path
    'data/memo.txt'
  end

  def append(memo)
    File.open(file_path, 'a') { |f| f.puts(memo) }
  end

  def delete(line_num)
    output = ''
    File.open(MemoFile.new.file_path) do |file|
      file.each_line do |line|
        output << line if file.lineno != line_num.chop.to_i
      end
    end
    open(MemoFile.new.file_path,"w") do |f|
      f.write output
    end
  end

  def read
    File.foreach(MemoFile.new.file_path).map { |line| line }
  end

  def read_with_index
    read.map.with_index do |line, index|
      "#{index+1}.#{line}"
    end
  end

end