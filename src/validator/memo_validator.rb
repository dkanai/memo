class MemoValidator

  def setValue(value)
    @value = value
    self
  end

  def numeric?
    (@value =~ /^[0-9]+$/) == 0
  end

  def gt100?
    @value.to_i > 100
  end

end