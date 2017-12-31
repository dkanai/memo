class NumericValidator

  attr_accessor :msg

  def initialize
    @msg = 'invalid input: not a number'
  end

  def valid?(value)
    (value =~ /^[0-9]+$/) == 0
  end

end