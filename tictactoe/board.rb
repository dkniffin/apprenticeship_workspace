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

    def unmove(x,y)
      @data[x][y] = nil
    end

    def cell_coords
      @data.each_with_index.map do |row,i|
        row.each_with_index.map do |cell,j|
          [i,j]
        end
      end.reduce(:+)
    end

    def free?(x,y)
      @data[x][y].nil?
    end

    def empty?
      cell_coords.all? {|x,y| @data[x][y].nil? }
    end

    def xs
  		(0..(width-1))
  	end

  	def ys
  		(0..(height-1))
  	end

    def rows
  		xs.map{|x| ys.map{|y| [x,y]}}
  	end

    def cols
  		ys.map{|y| xs.map{|x| [x,y]}}
  	end

    def diags
  		# TODO: Change this to dynamic generation
  		[[[0,0],[1,1],[2,2]],
  		 [[0,2],[1,1],[2,0]]]
  	end

    def set_coords
      rows + cols + diags
    end
  end
end
