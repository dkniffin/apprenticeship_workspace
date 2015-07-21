require_relative '../game'

module TicTacToe
  describe Game do
      context "new game" do
        subject(:game) { Game.new }
        describe "board" do
          it "is a Board" do
            expect(game.board).to be_a(Board)
          end
        end
      end
  end
end
