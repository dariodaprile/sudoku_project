require 'minitest/spec'
require 'minitest/autorun'
require '../lib/sudoku'

describe Sudoku do
  before do
    @puzzle_string = "940170058020006090175090304308000600010802900500934007009740580604005100000080023"
    @sudoku_solver = Sudoku.new(@puzzle_string)
    @solution_string = "946173258823456791175298364398517642417862935562934817239741586684325179751689423"
  end


  it "should calculate the row values for a particular cell index within the board" do
    expected = %w[9 4 0 1 7 0 0 5 8]
    @sudoku_solver.calc_row_values(0).must_equal expected
  end

  it "should calculate the column values for a particular cell index within the board" do
    expected = %w[9 0 1 3 0 5 0 6 0]
    @sudoku_solver.calc_col_values(0).must_equal expected
  end

  it "should calculate the box values for a particular cell index within the board" do
    expected = %w[9 4 0 0 2 0 1 7 5]
    @sudoku_solver.calc_box_values(0).must_equal expected
  end


  it "should solve the puzzle" do
    @sudoku_solver.solve.must_equal @solution_string
  end
end
