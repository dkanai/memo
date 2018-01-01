class ScoreHtmlFormatter

  def exec(data)
    "<h2>Show all score</h2>
#{append_p_to(data)}"
  end

  private 

  def append_p_to(data)
    data.map{|line|"<p>#{line.chomp}</p>\n"}.join('').chomp
  end

end