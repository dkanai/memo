class Scores

  attr_reader :db

  def initialize
    @db = FileService.new('data/score.txt')
  end

  def average
    all.map(&:score).map(&:to_i).average
  end

  def all
    @scores ||= db.all.map.with_index do |score, index|
      Score.new(score.chomp, index + 1)
    end
  end

end