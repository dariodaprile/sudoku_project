class Cell
  attr_reader :possible_values

  def initialize(value)
    if value == "0"
      @possible_values = ["1","2","3","4","5","6","7","8","9"]
    else
      @possible_values = [value.to_s]
    end
  end



  def calculate_value(row_values, col_values, box_values)
    @possible_values = @possible_values - row_values - col_values - box_values
  end

  def finalized?
    @possible_values.count == 1 # true if only one possible value
  end


  def to_s
    if finalized?
      @possible_values.first.to_s
    else
      "0"
    end
  end
end