class Scores

  attr_reader :file

  def initialize
    @file = FileService.new('data/memo.txt')
  end

  def average
    read.map(&:score).map(&:to_i).average
  end

  def read
    @scores ||= file.read.map.with_index do |line, index|
      data = line.split(',')
      Score.new(data[1].chomp, index + 1, data[0])
    end
  end

end