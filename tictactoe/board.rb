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
      cell_width = width == 3 ? 1 : 2
      @data.each_with_index.map do |row,i|
        row.each_with_index.map do |cell,j|
          value = (cell || (i * width + j))
          value.to_s.rjust(cell_width, padstr=' ') # Pad it with spaces
        end
      end
    end

    def to_s
      line_separator = "-----" * width
      cells_with_numbers.map do |row|
        row.join(" | ")
      end.join("\n#{line_separator}\n")
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

    def free_moves
      cell_coords.select{|x,y| free?(x,y)}
    end

    def full?
      cell_coords.none? {|x,y| @data[x][y].nil? }
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
      w = (width-1) # make the width zero based
      diag_1 = (0..w).map { |x| [x,x] } # top-left to bottom-right
      diag_2 = (0..w).map { |x| [x,w-x] } # top-right to bottom-right

      [diag_1, diag_2]
  	end

    def set_coords
      rows + cols + diags
    end

    def sets
      set_coords.map{|set| set.map{|x,y| @data[x][y]}}
    end

    def winner
      sets.each do |set|
        if set.uniq.length == 1 && set[0] != nil
          return set[0]
        end
      end
      nil
    end

    def end?
      full? || winner != nil
    end

    def max_pos_num
      width * height - 1
    end
  end
end
