describe 'run' do

  subject {StdOut.print(@scoreOperator)}

  xit 'read file memo with line number' do
    expect(subject.msg).to include "48.7"
  end

end