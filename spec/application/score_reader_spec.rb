describe 'run' do

  before do
    File.delete(Scores.new.file.path) if File.exist?(Scores.new.file.path)
    allow(StdOut).to receive(:print).and_return('') 
    Scores.new.file
          .append("kanai,10")
          .append("kanai,20")
  end

  context 'text formatter' do
    subject {ScoreReader.new(ScoreTextFormatter.new).run}
    it 'read file memo with line number' do
      expect(subject.msg).to include "1.kanai,10"
      expect(subject.msg).to include "2.kanai,20"
      expect(subject.msg.class).to eq String
    end
  end

  context 'html formatter' do
    subject {ScoreReader.new(ScoreHtmlFormatter.new).run}
    it 'read as html' do
      expect(subject.msg).to include "<h2>Show all score</h2>"
      expect(subject.msg).to include "<p>1.kanai,10</p>"
    end
  end

end
