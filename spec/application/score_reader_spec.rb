describe 'run' do

  before do
    File.delete(Scores.new.file.file_path) if File.exist?(Scores.new.file.file_path)
    allow(StdOut).to receive(:print).and_return('') 
    Scores.new.file.append("10")
    Scores.new.file.append("20")
  end

  context 'text formatter' do
    subject {ScoreReader.new(ScoreTextFormatter.new).run}
    it 'read file memo with line number' do
      expect(subject.msg).to include "1.10"
      expect(subject.msg).to include "2.20"
      expect(subject.msg.class).to eq String
    end
  end

  context 'html formatter' do
    subject {ScoreReader.new(ScoreHtmlFormatter.new).run}
    it 'read as html' do
      expect(subject.msg).to include "<h2>Show all score</h2>"
      expect(subject.msg).to include "<p>1.10</p>"
    end
  end

end
