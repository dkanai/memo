class LessThanValidator

  attr_accessor :msg

  def initialize(threshold)
    @msg = '>invalid input: less than 100.'
    @threshold = threshold
  end

  def valid?(value)
    value.to_i < @threshold
  end

end