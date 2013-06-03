require 'minitest/spec'
require 'minitest/autorun'
require '../lib/board'

describe Board do
    before do
      puzzle_string = "940170058020006090175090304308000600010802900500934007009740580604005100000080023"
      @board = Board.new(puzzle_string)

    end
end