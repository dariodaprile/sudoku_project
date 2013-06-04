require 'minitest/spec'
require 'minitest/autorun'
require '../lib/board_printer'
require '../lib/board'

describe BoardPrinter do
  before do
    @puzzle_string = "940170058020006090175090304308000600010802900500934007009740580604005100000080023"
    @board_printer = BoardPrinter.new
    @board = Board.new(@puzzle_string)
  end

  it "should print a board" do
    @board_printer.print(@board)
  end
end