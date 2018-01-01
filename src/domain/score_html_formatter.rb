class ScoreHtmlFormatter

  def exec(scores)
    "<h2>Show all score</h2>
#{scores.map(&:p_tag).join('').chomp}"
  end

end