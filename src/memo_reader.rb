class MemoReader

  def run
    file_data = MemoFile.new.read
    file_data.map.with_index do |line, index|
      "#{index+1}.#{line}"
    end
  end

end