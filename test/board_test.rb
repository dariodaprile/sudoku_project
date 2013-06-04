require 'minitest/spec'
require 'minitest/autorun'
require '../lib/board'


describe Board do
  before do
    @puzzle_string = "940170058020006090175090304308000600010802900500934007009740580604005100000080023"
    @board = Board.new(@puzzle_string)
  end

  it "should have a collection of cells" do
    @board.cells.must_be_instance_of Array
  end

  it "should return a string of the values of its cells" do
    @board.to_s.must_equal @puzzle_string.gsub(/0/,"*")
  end

  it "should print a pretty representation of itself" do
    puts
    puts @board.print_self
    puts
  end

  # it "should know whether it is valid" do
  #   invalid_sudoku_solution = "123456789123456789123456789123456789123456789123456789123456789123456789123456789"
  #   invalid_board = Board.new(invalid_sudoku_solution)
  #   invalid_board.valid?.must_equal false
  # end

end
