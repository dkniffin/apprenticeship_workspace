module TicTacToe
  class Board
    attr_accessor :cells

    def initialize(w=3,h=3)
      @cells = Array.new(w) { Array.new(h) { nil }} # w x h array of arrays
    end

    def width
      @cells.length
    end
    def height
      @cells[0].length
    end
  end
end
