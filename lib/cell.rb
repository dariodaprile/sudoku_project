class Cell
  include Comparable
  attr_reader :possible_values

  def initialize(value)
    raise ArgumentError unless value.is_a?(String)
    @possible_values = (value == "0") ? ["1","2","3","4","5","6","7","8","9"] : [value.to_s]
  end

  def calculate_possible_values(row_values, col_values, box_values)
    @possible_values = @possible_values - row_values - col_values - box_values
  end

  def pick_a_value!
    @possible_values = @possible_values[Random.rand(@possible_values.count),1]
  end

  def finalized?
    possible_values.count == 1
  end

  def to_s
    return possible_values.first.to_s if finalized?
    "*"
  end

  def <=>(other_cell)
    return possible_values.length <=> other_cell.possible_values.length
  end

end
