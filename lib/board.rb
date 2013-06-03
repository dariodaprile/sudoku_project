require_relative 'cell'

class Board
attr_reader :cells

def initialize(puzzle_string)
  @cells = puzzle_string.split('').map {|value| Cell.new(value) }
end

def to_s
  @cells.join
end

def print_self
  @cells.each_with_index do |cell, index|
     print "|\n\n" if (index % 9 == 0) && index != 0
     print "+---------+---------+---------+\n" if (index % 27 == 0)
     print "|" if (index % 3 == 0)
     print " " + cell.to_s + " "
  end
  print "|\n+---------+---------+---------+\n\n"
end

def sort
  @cells.sort
end


#print representation of a board
#+-----------+-----------+-----------+
#| 1   *   * | 2   *     | 5         |
#
#| *   3   * | 2   *   6 |         7 |
#
#| 1   *   * |     4     | 9         |
#+-----------+-----------+-----------+
#| 1         | 2         | 5         |
#
#|     3     | 2       6 |         7 |
#
#| 1         |     4     | 9         |
#+-----------+-----------+-----------+
#| 1         | 2         | 5         |
#|
#|     3     | 2       6 |         7 |
#|
#| 1         |     4     | 9         |
#+-----------+-----------+-----------+


end