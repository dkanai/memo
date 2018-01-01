class StdOut

  def self.print(value, color='white')
    if value.class == Array
      puts value
    else
      puts "\e[#{color_map(color)}m>#{value}\e[m\n"
    end
  end

  def self.color_map(color)
    {
      'white' => 37,
      'red'   => 31,
      'green' =>32
    }[color]
  end

end