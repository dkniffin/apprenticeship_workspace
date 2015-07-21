require_relative '../ai'
require_relative '../board'

module TicTacToe
	describe AI do
		subject(:board) { Board.new }
		context "AI is X" do
			subject(:ai) { AI.new('X','O') }

			it "has token X" do
				expect(ai.token).to eq('X')
			end
			it "has playerToken O" do
				expect(ai.playerToken).to eq('O')
			end
		end
	end
end
