class Memo

  def initialize(operation)
    @operation = operation
  end

  def run
    if @operation == 1
      create
    elsif @operation == 2
      read
    else 
      delete
    end
  end

end

def create
  'create'
end

def read
  'read'
end

def delete
  'delete'
end