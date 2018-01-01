class FileService

  attr_reader :file_path

  def initialize(path)
    @file_path = path
  end

  def append(input)
    File.open(file_path, 'a') { |f| f.puts(input) }
  end

  def delete_line(num)
    output = ''
    File.open(file_path) do |file|
      file.each_line do |line|
        output << line if file.lineno != num.chop.to_i
      end
    end
    open(file_path,"w") do |f|
      f.write output
    end
  end

  def read
    File.foreach(file_path).map { |line| line }
  end

end