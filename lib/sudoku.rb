require_relative 'board'

# sudoku calculates
class Sudoku

def initialize(puzzle_string)
  @board = Board.new(puzzle_string)
  # @board.print_self
end

def solve
  @board.cells.each_with_index do |cell,index|
    print "this bit is executed for #{cell.to_s}"
    puts " which is finalized?: #{cell.finalized?}"
    unless cell.finalized?
      print "this bit is executed for index: #{index}"
      row = self.calc_row_values(index)
      col = self.calc_col_values(index)
      box = self.calc_box_values(index)
      cell.calculate_value(row, col, box)
      puts " and the cell's possible_values are #{cell.possible_values}"
    end
  end
  @board.print_self
  @board.to_s
end

def calc_row_values(cell_index)
  row_num = (cell_index / 9)
  row_values = []
   @board.cells.each_with_index do |cell, index|
     row_values << cell.to_s if (index / 9 == row_num)
  end
  row_values
end

def calc_col_values(cell_index)
  col_num = cell_index % 9
  col_values = []
  @board.cells.each_with_index do |cell,index|
     col_values << cell.to_s if index % 9 == col_num
  end
  col_values
end

def calc_box_values(cell_index)
  row_num = cell_index / 9 / 3
  col_num = (cell_index % 9) / 3

  # box_num = (cell_index / 3) % 3
  box_values = []
  @board.cells.each_with_index do |cell,index|
     box_values << cell.to_s if ((index / 9 / 3) == row_num && (index % 9) / 3 == col_num)
  end
  box_values
end

end