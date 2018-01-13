class Scores

  attr_reader :db

  def initialize
    @db = FileService.new('data/score.txt')
  end

  def average
    all.map(&:score).map(&:to_i).average
  end

  def all
    @scores ||= db.all.map.with_index do |line, index|
      data = line.split(',')
      Score.new(data[1].chomp, index + 1, data[0])
    end
  end

end