require_relative '../ai'
require_relative '../board'

module TicTacToe
  describe AI do
    subject(:ai) { AI.new('X','O') }

    it "has token X" do
      expect(ai.token).to eq('X')
    end
    it "has playerToken O" do
      expect(ai.playerToken).to eq('O')
    end

    describe ".move" do
      context "on any size board" do
        subject(:board) { Board.new }

        context "empty board" do
          before { ai.move(board) }
          it "takes the top left" do
            expect(board.data[0][0]).to eq('X')
          end
        end
        describe "returned value" do
          it "is the move it makes" do
            retVal = ai.move(board)
            expect(retVal).to eq([0,0]) # Assuming the "top left" test passes
          end
        end
      end

      context "on a 3x3 board" do
        subject(:board) { Board.new(3,3) }
        # Win
        context "two of AI's tokens in a row" do
          before do
            board.move(0,0,'X')
            board.move(0,1,'X')
          end
          it "wins" do
            expect(ai.move(board)).to eq([0,2])
          end
        end
        context "two of AI's tokens in a column" do
          before do
            board.move(0,0,'X')
            board.move(1,0,'X')
          end
          it "wins" do
            expect(ai.move(board)).to eq([2,0])
          end
        end
        context "two of AI's tokens in a diagonal" do
          before do
            board.move(0,0,'X')
            board.move(1,1,'X')
          end
          it "wins" do
            expect(ai.move(board)).to eq([2,2])
          end
        end

        # Block
        context "two of Player's tokens in a row" do
          before do
            board.move(0,0,'O')
            board.move(0,1,'O')
          end
          it "blocks" do
            expect(ai.move(board)).to eq([0,2])
          end
        end
        context "two of Player's tokens in a column" do
          before do
            board.move(0,0,'O')
            board.move(1,0,'O')
          end
          it "blocks" do
            expect(ai.move(board)).to eq([2,0])
          end
        end
        context "two of Player's tokens in a diagonal" do
          before do
            board.move(0,0,'O')
            board.move(1,1,'O')
          end
          it "blocks" do
            expect(ai.move(board)).to eq([2,2])
          end
        end

        # Prioritize win over block
        context "two of Player's tokens in a row, but also two of AI's tokens in a row" do
          before do
            board.move(0,0,'O')
            board.move(0,1,'O')

            board.move(1,0,'X')
            board.move(1,1,'X')
          end
          it "wins" do
            expect(ai.move(board)).to eq([1,2])
          end
        end

        # Don't make any losing mistakes
        context "Player is in center" do
          before { board.move(1,1,'O') }
          it "doesn't take an edge" do
            move = ai.move(board)
            expect(move).to_not eq([0,1])
            expect(move).to_not eq([1,0])
            expect(move).to_not eq([2,1])
            expect(move).to_not eq([1,2])
          end
          context "and AI has bottom left corner" do
            before { board.move(0,2,'X') }
            it "doesn't take an edge" do
                move = ai.move(board)
                expect(move).to_not eq([0,1])
                expect(move).to_not eq([1,0])
                expect(move).to_not eq([2,1])
                expect(move).to_not eq([1,2])
            end
          end
        end

        # Prioritize win over mistakes
        context "a winning move is available, but it would be considered a mistake otherwise" do
          before do
            board.move(1,1,'O')
            board.move(0,2,'X')
            board.move(0,1,'O')
            board.move(2,2,'X')
          end
          it "wins" do
            expect(ai.move(board)).to eq([1,2])
          end
        end
      end

      context "on a 4x4 board" do
        subject(:board) { Board.new(4,4) }
        # Win
        context "three of AI's tokens in a row" do
          before do
            board.move(0,0,'X')
            board.move(0,1,'X')
            board.move(0,2,'X')
          end
          it "wins" do
            expect(ai.move(board)).to eq([0,3])
          end
        end
        context "three of AI's tokens in a column" do
          before do
            board.move(0,0,'X')
            board.move(1,0,'X')
            board.move(2,0,'X')
          end
          it "wins" do
            expect(ai.move(board)).to eq([3,0])
          end
        end
        context "three of AI's tokens in a diagonal" do
          before do
            board.move(0,0,'X')
            board.move(2,2,'X')
            board.move(3,3,'X')
          end
          it "wins" do
            expect(ai.move(board)).to eq([1,1])
          end
        end

        # Block
        context "three of AI's tokens in a row" do
          before do
            board.move(0,0,'O')
            board.move(0,1,'O')
            board.move(0,2,'O')
          end
          it "wins" do
            expect(ai.move(board)).to eq([0,3])
          end
        end
        context "three of AI's tokens in a column" do
          before do
            board.move(0,0,'O')
            board.move(1,0,'O')
            board.move(2,0,'O')
          end
          it "wins" do
            expect(ai.move(board)).to eq([3,0])
          end
        end
        context "three of AI's tokens in a diagonal" do
          before do
            board.move(0,0,'O')
            board.move(2,2,'O')
            board.move(3,3,'O')
          end
          it "wins" do
            expect(ai.move(board)).to eq([1,1])
          end
        end
        # Prioritize win over block
        context "three of Player's tokens in a row, but also three of AI's tokens in a row" do
          before do
            board.move(0,0,'O')
            board.move(0,1,'O')
            board.move(0,2,'O')

            board.move(1,0,'X')
            board.move(1,1,'X')
            board.move(1,2,'X')
          end
          it "wins" do
            expect(ai.move(board)).to eq([1,3])
          end
        end
      end
    end
  end
end
