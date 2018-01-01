class FileService

  attr_reader :path

  def initialize(path)
    @path = path
  end

  def append(input)
    File.open(path, 'a') { |f| f.puts(input) }
  end

  def delete_line(num)
    new_data = read.delete_if.with_index{|_, i| i == num.to_i-1}
    File.open(path,"w") do |f|
      f.write new_data.join('') if !new_data.empty?
    end
  end

  def read
    File.foreach(path).map { |line| line }
  end

end