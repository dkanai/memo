class Scores

  attr_reader :file

  def initialize
    @file = FileService.new('data/memo.txt')
  end

  def average
    file.read.map(&:chomp).map(&:to_i).average
  end

  def read_with_index
    file.read_with_index
  end

end