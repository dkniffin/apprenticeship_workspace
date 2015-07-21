module TicTacToe
  class Board
    attr_accessor :data

    def initialize(w=3,h=3)
      @data = Array.new(w) { Array.new(h) { nil }} # w x h array of arrays
    end

    def width
      @data.length
    end

    def height
      @data[0].length
    end

    def cells_with_numbers
      @data.each_with_index.map do |row,i|
        row.each_with_index.map do |cell,j|
          cell || i * width + j
        end
      end
    end

    def to_s
      cells_with_numbers.map{|row| row.join(" | ")}.join("\n---------\n")
    end

    def move(x,y,token)
      @data[x][y] = token
    end
  end
end
