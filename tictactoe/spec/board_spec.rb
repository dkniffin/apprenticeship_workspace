require_relative '../board'

module TicTacToe
  describe Board do
    context "when default" do
      subject(:board) { Board.new }

      it "is empty" do
        expect(board.data).to eq([[nil,nil,nil],
                                   [nil,nil,nil],
                                   [nil,nil,nil]])
      end
      it "is a 3x3" do
        expect(board.width).to eq(3)
        expect(board.height).to eq(3)
      end

      describe ".to_s" do
        it "returns a string representing the board" do
          expect(board.to_s).to eq("0 | 1 | 2\n---------\n3 | 4 | 5\n---------\n6 | 7 | 8")
        end
      end
    end
  end
end
