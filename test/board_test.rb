require 'minitest/spec'
require 'minitest/autorun'
require '../lib/board'


describe Board do
  before do
    @puzzle_string = "940170058020006090175090304308000600010802900500934007009740580604005100000080023"
    @completed_board_string = (1..9).to_a.join * 9
    @board = Board.new(@puzzle_string)
  end

  it "should have a collection of cells" do
    @board.cells.must_be_instance_of Array
  end

  it "should return a string of the values of its cells" do
    @board.to_s.must_equal @puzzle_string.gsub(/0/,"*")
  end

  it "should calculate the row values for a particular cell index" do
    expected = %w[9 4 * 1 7 * * 5 8]
    @board.send(:calc_row_values, 0).must_equal expected
  end

  it "should calculate the column values for a particular cell index" do
    expected = %w[9 * 1 3 * 5 * 6 *]
    @board.send(:calc_col_values, 0).must_equal expected
  end

  it "should calculate the box values for a particular cell index" do
    expected = %w[9 4 * * 2 * 1 7 5]
    @board.send(:calc_box_values, 0).must_equal expected
  end


  it "should know when it is complete" do
    completed_board = Board.new(@completed_board_string)
    completed_board.complete?.must_equal true
  end

  it "should know whether it is valid" do
     invalid_board = Board.new(@completed_board_string)
     invalid_board.valid?.must_equal false
  end

end
