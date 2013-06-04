
require 'minitest/spec'
require 'minitest/autorun'
require '../lib/sudoku_solver'

describe SudokuSolver do
  before do
    @simple_puzzle_string = "940170058020006090175090304308000600010802900500934007009740580604005100000080023"
    @simple_solution_string = "946173258823456791175298364398517642417862935562934817239741586684325179751689423"
    @simple_sudoku_solver = SudokuSolver.new(@simple_puzzle_string)

    @hard_puzzle_string = "020030000100000050807006000080063109700092000003400600000000804060070000400000270"
    @hard_sudoku_solver = SudokuSolver.new(@hard_puzzle_string)
    @hard_solution_string = "624537918139248756857916432285763149746192385913485627571329864362874591498651273"
  end


  it "should calculate the row values for a particular cell index within the board" do
    expected = %w[9 4 * 1 7 * * 5 8]
    @simple_sudoku_solver.calc_row_values(0).must_equal expected
  end

  it "should calculate the column values for a particular cell index within the board" do
    expected = %w[9 * 1 3 * 5 * 6 *]
    @simple_sudoku_solver.calc_col_values(0).must_equal expected
  end

  it "should calculate the box values for a particular cell index within the board" do
    expected = %w[9 4 * * 2 * 1 7 5]
    @simple_sudoku_solver.calc_box_values(0).must_equal expected
  end

  it "should know when the problem is solved" do
    solved_sudoku = SudokuSolver.new(@simple_solution_string) # pass in a solved puzzle
    solved_sudoku.solved?.must_equal true
  end

  it "should solve simple puzzles" do
    @simple_sudoku_solver.solve.must_equal @simple_solution_string
    
  end

  it "should solve hard puzzles (i.e. where cells still have multiple values after simple solve is complete)" do
    skip
    @hard_sudoku_solver.solve.must_equal @hard_solution_string
  end

end
