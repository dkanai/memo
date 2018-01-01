class Scores

  attr_reader :file

  def initialize
    @file = FileService.new('data/memo.txt')
  end

  def average
    file.read.map(&:chomp).map(&:to_i).average
  end

  def read
    file.read.map.with_index do |line, index|
      Score.new(line, index + 1)
    end
  end

end