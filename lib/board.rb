
class Board
# attr_reader :cells
946173258823456791175298364398517642417862935562934817239741586684325179751689423
# def initialize(puzzle_string)
#   @cells = []
#   puzzle_array = puzzle_string.split('')
#   puzzle_array.each do |value|
#        @cells << Cell.new(value)
#   end
# end

# def to_s
# @cells.join
# end


# def print
#   print "+-----------+-----------+-----------+\n"
#   @cells.each_with_index do |cell, index|
#      print "|" if index % 3
#      print " " + cell.to_s + " "
#      print "|\n\n" if index % 9
#      print "+-----------+-----------+-----------+\n" if index % 27
#   end
# end

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