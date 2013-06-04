require 'minitest/spec'
require 'minitest/autorun'
require '../lib/sudoku_solver'
require '../lib/board_printer'

describe SudokuSolver do
  before do
    @printer = MiniTest::Mock.new

    @simple_puzzle_string = "940170058020006090175090304308000600010802900500934007009740580604005100000080023"
    @simple_board = Board.new(@simple_puzzle_string)
    @simple_solution_string = "946173258823456791175298364398517642417862935562934817239741586684325179751689423"
    @simple_sudoku_solver = SudokuSolver.new(@simple_board, @printer)

    @hard_puzzle_string = "020030000100000050807006000080063109700092000003400600000000804060070000400000270"
    @hard_board = Board.new(@hard_puzzle_string)
    @hard_sudoku_solver = SudokuSolver.new(@hard_board, @printer)
    @hard_solution_string = "624537918139248756857916432285763149746192385913485627571329864362874591498651273"
  end

  it "should know when the problem is solved" do
    solved_board = Board.new(@simple_solution_string)
    solved_sudoku = SudokuSolver.new(solved_board, @printer) # pass in a solved puzzle
    solved_sudoku.solved?.must_equal true
  end

  it "should delegate printing to a printer" do
    @printer.expect(:print, true, [@simple_board])
    @simple_sudoku_solver.print_board
    @printer.verify
  end

  it "should solve simple puzzles" do
    @printer.expect(:print, true, [@simple_board])
    @simple_sudoku_solver.solve.must_equal @simple_solution_string

  end

  it "should solve hard puzzles (i.e. where cells still have multiple values after simple solve is complete)" do
    skip
    @printer.expect(:print, true, [@hard_board])
    @hard_sudoku_solver.solve.must_equal @hard_solution_string
  end

end
