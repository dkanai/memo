require './src/lib/io/file_service.rb'

class ScoreFile < FileService

  def self.file_path
    'data/memo.txt'
  end

end