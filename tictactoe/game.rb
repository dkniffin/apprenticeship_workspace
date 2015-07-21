require_relative 'board'

module TicTacToe
  class Game
    attr_reader :board
    def initialize(w=3,h=3)
      @board = Board.new(w,h)
    end
  end
end
