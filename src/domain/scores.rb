require './src/lib/io/file_service.rb'

class Scores < FileService

  def initialize
    @file_service = FileService.new
  end

  def self.file_path
    'data/memo.txt'
  end

  def self.average
    read.map(&:chomp).map(&:to_i).average
  end

end