require_relative 'cell'

class Board
attr_reader :cells

def initialize(puzzle_string)
  @cells = puzzle_string.split('').map {|value| Cell.new(value) }
end

def complete?
  @cells.all? {|cell| cell.finalized?}
end

def valid?
  all_boxes_valid && all_colums_valid && all_rows_valid
end

def calculate_possible_values(cell, index)
  unless cell.finalized?
    row = calc_row_values(index) # array of values in same row as cell
    col = calc_col_values(index) # array of values in same col as cell
    box = calc_box_values(index) # array of values in same box as cell
    cell.calculate_possible_values(row, col, box)
  end
end

def to_s
  @cells.join
end


private

def all_boxes_valid
  box_indexes = [0, 3, 6, 27, 30, 33, 54, 57, 60] #index of cell top left of box
  box_indexes.all? do |box_index|
    calc_row_values(box_index).uniq.length == 9
  end
end


def all_colums_valid
  col_indexes = [0, 1, 2, 3, 4, 5, 6, 7, 8] # index of cell top of column
  col_indexes.all? do |col_index|
    calc_col_values(col_index).uniq.length == 9
  end
end

def all_rows_valid
  row_indexes = [0, 9, 18, 27, 36, 45, 54, 63, 72] # index of cell far left of row
  row_indexes.all? do |row_index|
    calc_box_values(row_index).uniq.length == 9
  end
end

def calc_row_values(cell_index)
  row_num = (cell_index / 9)
  row_values = []
   @cells.each_with_index do |cell, index|
     row_values << cell.to_s if (index / 9 == row_num)
  end
  row_values
end

def calc_col_values(cell_index)
  col_num = cell_index % 9
  col_values = []
  @cells.each_with_index do |cell,index|
     col_values << cell.to_s if index % 9 == col_num
  end
  col_values
end

def calc_box_values(cell_index)
  row_num = cell_index / 9 / 3
  col_num = (cell_index % 9) / 3
  box_values = []
  @cells.each_with_index do |cell,index|
     box_values << cell.to_s if ((index / 9 / 3) == row_num && (index % 9) / 3 == col_num)
  end
  box_values
end

end