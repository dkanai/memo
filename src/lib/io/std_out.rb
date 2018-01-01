class StdOut

  def self.print(value)
    if value.class == Array
      puts value
    else
      puts ">#{value}\n"
    end
  end

end