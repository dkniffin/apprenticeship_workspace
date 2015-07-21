require_relative '../board'

module TicTacToe
  describe Board do
    context "when default" do
      subject(:board) { Board.new }

      it "is empty" do
        expect(board.cells).to eq([[nil,nil,nil],
                                   [nil,nil,nil],
                                   [nil,nil,nil]])
      end
      it "is a 3x3" do
        expect(board.width).to eq(3)
        expect(board.height).to eq(3)
      end
    end
  end
end
