class FileService

  attr_reader :path

  def initialize(path)
    @path = path
  end

  def append(input)
    File.open(path, 'a') { |f| f.puts(input) }
  end

  def delete_line(num)
    output = ''
    File.open(path) do |file|
      file.each_line do |line|
        output << line if file.lineno != num.chop.to_i
      end
    end
    open(path,"w") do |f|
      f.write output
    end
  end

  def read
    File.foreach(path).map { |line| line }
  end

end