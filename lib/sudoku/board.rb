module Sudoku
  class Board
    def initialize(raw_data)
      DataValidator.validate!(raw_data.split("\n").join)
      @board = []
      raw_data.split("\n").each_with_index do |line, y|
        b = []
        line.chars.each_with_index do |d, x|
          b << Cell.new(x, y, d)
        end
        @board << b
      end
      show
      p sub_grid_group(3, 4)
    end

    def show
      @board.each do |y_axis|
        y_axis.each do |cell|
          cell.show
        end
        puts ""
      end
    end

    def x_group(x, y)
      @board[y]
    end

    def y_group(x, y)
      @board.flatten.select { |c| c.x == x }
    end

    def sub_grid_group(x, y)
      x_grid = x / 3
      y_grid = y / 3
      @board.flatten.select { |c| c.x_grid == x_grid && c.y_grid == y_grid }
    end
  end
end