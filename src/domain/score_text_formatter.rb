class ScoreTextFormatter

  def exec(scores)
    "Show all score
#{scores.map(&:with_index).join('').chomp}"
  end

end