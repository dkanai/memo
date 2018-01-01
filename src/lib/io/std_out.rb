class StdOut

  def self.print(value, color='white')
   puts "\e[#{color_map[color]}m>#{value}\e[m\n"
  end

  def self.color_map
    {
      'white' => 37,
      'red'   => 31,
      'green' =>32
    }
  end

end