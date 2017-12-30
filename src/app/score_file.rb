require './src/lib/io/file_wrapper.rb'

class ScoreFile < FileWrapper

  def self.file_path
    'data/memo.txt'
  end

end