class StdOut

  def self.print(value)
    if value.class == Array
      puts value
    else
      # puts "\e[32m>#{value}\e[m\n"
      puts ">#{value}\n"
    end
  end

end