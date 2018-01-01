class ScoreOperatorResult

  attr_accessor :status, :msg

  def initialize(status, msg)
    @status = status
    @msg = msg
  end

  def color
    {
      'error' => 'red',
      'success' => 'green',
    }.fetch(status, 'white')
  end

end