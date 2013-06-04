
require_relative 'board'

# sudoku calculates
class SudokuSolver

def initialize(puzzle_string)
  @board = Board.new(puzzle_string)
end

def solve
  simple_solve
  @board.print_self if solved?
  return @board.to_s if solved?
  raise "Cannot solve problem."
end

def hard_solve

end

def simple_solve
  9.times do
    @board.cells.each_with_index do |cell,index|
      unless cell.finalized?
        row = self.calc_row_values(index)
        col = self.calc_col_values(index)
        box = self.calc_box_values(index)
        cell.calculate_possible_values(row, col, box)
      end
    end
  end
end
private :simple_solve

def solved?
  @board.cells.all? {|cell| cell.finalized?}
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
  box_values = []
  @board.cells.each_with_index do |cell,index|
     box_values << cell.to_s if ((index / 9 / 3) == row_num && (index % 9) / 3 == col_num)
  end
  box_values
end

end
