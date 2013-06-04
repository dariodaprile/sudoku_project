
require_relative 'board'
require_relative 'board_printer'

# sudoku calculates
class SudokuSolver

def initialize(board, printer=BoardPrinter.new)
  @board = board
  @printer = printer
end

def print_board
  @printer.print(@board)
end

def solved?
  @board.complete?
end

def solve
  simple_solve
  @printer.print(@board) if solved?
  return @board.to_s if solved?
  raise "Cannot solve problem."
end

def simple_solve
  9.times do
    @board.cells.each_with_index do |cell, index|
      @board.calculate_possible_values(cell, index)
    end
  end
end
private :simple_solve

# def hard_solve
# end

end
