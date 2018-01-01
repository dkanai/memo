class ScoreTextFormatter

  def exec(scores)
    "Show all score
#{scores.map(&:to_s_with_newline).join('').chomp}"
  end

end