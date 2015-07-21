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

			describe ".move" do
        def run_all_boards(in_b,turn,moves=[])
					b = Marshal.load(Marshal.dump(in_b)) # clone the board

          if turn == ai.token # AI's turn
						move = ai.move(b)
						moves.push("#{ai.token}->#{move}")
						run_all_boards(b,ai.playerToken,moves)
					else # Player's turn
						for x,y in b.cell_coords
							moves_copy = Marshal.load(Marshal.dump(moves))
							if b.free?(x,y)
								move = b.move(x,y,ai.token)
								moves_copy.push("#{ai.playerToken}->#{move}")
								run_all_boards(b,ai.playerToken,moves_copy)
								b.unmove(x,y)
							end
						end
					end
        end
				it "takes the best move, in all cases" do
					run_all_boards(board,ai.token)
				end
			end
		end
	end
end
