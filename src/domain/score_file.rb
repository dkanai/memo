require './src/lib/io/file_service.rb'

class ScoreFile < FileService

  def self.file_path
    'data/memo.txt'
  end

  def self.average
    read.map(&:chomp).map(&:to_i).average
  end

end