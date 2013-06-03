
# sudoku calculates
class Sudoku

# def self.solve(puzzle_string)
#   @board = Board.new(puzzle_string)
#   @board.cells.each_with_index do |cell,index|
#     unless cell.finalized?
#       row = @board.calc_row_values(index)
#       col = @board.calc_col_values(index)
#       box = @board.calc_box_values(index)
#       cell.calculate_value(row, col, box)
#     end
#   end
#   board.print
#   board.to_s
# end

# def self.calc_row_values(cell_index)
#   row_num = (index / 9)
#   row_values = []
#    @board.cells.each_with_index do |cell,index|
#      row_values << cell.to_s if (index / 9 == row_num)
#   end
# end

# def self.calc_col_values(cell_index)
#   col_num = index % 9
#   col_values = []
#   @board.cells.each_with_index do |cell,index|
#      col_values << cell.to_s if index % 9 == col_num
#   end
# end

# def self.calc_box_values(cell_index)
#   box_num = (cell_index / 3) % 3
#   box_values = []
#   @board.cells.each_with_index do |cell,index|
#      box_values << cell.to_s if (index / 3) % 3 == box_num
#   end
# end

end