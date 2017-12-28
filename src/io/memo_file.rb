class MemoFile

  def file_path
    'data/memo.txt'
  end

  def append(memo)
    File.open(file_path, 'a') { |f| f.puts(memo) }
  end

  def read
    file_data = []
    File.open(MemoFile.new.file_path) do |file|
      file.each_line do |line|
        file_data.push(line)
      end
    end
    file_data
  end

  def read_with_index
    read.map.with_index do |line, index|
      "#{index+1}.#{line}"
    end
  end

end