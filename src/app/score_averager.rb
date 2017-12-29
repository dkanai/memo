class ScoreAverager

  def run
    ">Score Average: #{score_average}"
  end

  def score_average
    file_data = ScoreFile.new.read 
    ((file_data.map(&:chomp!).map(&:to_i).sum).to_f / file_data.size).round(1)
  end

end