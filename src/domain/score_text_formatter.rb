class ScoreTextFormatter

  def exec(scores)
    "Show all score
#{scores.map(&:score_with_index).join('').chomp}"
  end

end