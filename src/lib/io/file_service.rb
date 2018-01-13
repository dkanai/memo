class FileService

  attr_reader :path

  def initialize(path)
    @path = path
  end

  def create(input)
    File.open(path, 'a') { |f| f.puts(input) }
    self
  end

  def delete(num)
    new_data = all.delete_if.with_index{|_, i| i == num.to_i-1}
    File.open(path,"w") do |f|
      f.write new_data.join('') if !new_data.empty?
    end
  end

  def all
    File.foreach(path).map { |line| line }
  end

end