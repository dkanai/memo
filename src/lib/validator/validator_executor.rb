class ValidatorExecutor

  attr_accessor :errors, :value

  def initialize(validators)
    @validators = validators
    @errors = []
  end

  def invalid?
    @errors = @validators.collect do |validator|
      validator.msg if !validator.valid?(value)
    end.compact
    !@errors.empty?
  end

  def set_value(value)
    self.value = value
    self
  end

end