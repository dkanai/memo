class FileService

  def self.append(memo)
    File.open(file_path, 'a') { |f| f.puts(memo) }
  end

  def self.delete(line_num)
    output = ''
    File.open(file_path) do |file|
      file.each_line do |line|
        output << line if file.lineno != line_num.chop.to_i
      end
    end
    open(file_path,"w") do |f|
      f.write output
    end
  end

  def self.read
    File.foreach(file_path).map { |line| line }
  end

  def self.read_with_index
    read.map.with_index do |line, index|
      "#{index+1}.#{line}"
    end
  end

end