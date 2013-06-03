class Cell
  attr_reader :possible_values

  def initialize(value)
    @possible_values = (value == 0) ? (1..9).to_a : [value]
  end



  def calculate_value(row_values, col_values, box_values)
    @possible_values = @possible_values - row_values - col_values - box_values
  end

  def finalized?
    @possible_values.count == 1 # true if only one possible value
  end


  def to_s
    return @possible_values.first.to_s if finalized?
    "*"
  end
end