class Validator

  attr_accessor :errors

  def initialize(validators)
    @validators = validators
    @errors = []
  end

  def invalid?
    @errors = @validators.collect do |validator|
      validator.msg if !validator.valid?(@value)
    end.compact
    !@errors.empty?
  end

  def setValue(value)
    @value = value
    self
  end

end