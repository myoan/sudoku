module Sudoku
  class Cell
    attr_reader :x, :y, :data
    def initialize(x, y, data)
      @x = x
      @y = y
      @data = data == "x" ? 0 : data.to_i
    end

    def x_grid
      x / 3
    end

    def y_grid
      y / 3
    end

    def show
      if @data.zero?
        print "-"
      else
        print @data
      end
    end
  end
end