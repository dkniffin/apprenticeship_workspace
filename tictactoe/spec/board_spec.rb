require_relative '../board'

module TicTacToe
  describe Board do
    subject(:board) { Board.new }

    context "default board" do
      it "is empty" do
        expect(board.data).to eq([[nil,nil,nil],
                                  [nil,nil,nil],
                                  [nil,nil,nil]])
      end
      it "is a 3x3" do
        expect(board.width).to eq(3)
        expect(board.height).to eq(3)
      end
    end

    describe ".to_s" do
      it "returns a string representing the board" do
        expect(board.to_s).to eq("0 | 1 | 2\n---------\n3 | 4 | 5\n---------\n6 | 7 | 8")
      end
    end

    describe ".move" do
      before { board.move(0,0,'X') }
      it "adds the given token to the right location" do
        expect(board.data[0][0]).to eq('X')
      end
    end

    describe ".unmove" do
      before do
        board.move(0,0,'X')
        board.unmove(0,0)
      end
      it "removes the token from the space" do
        expect(board.data[0][0]).to eq(nil)
      end
    end

    describe ".free?" do
      context "when there is no token" do
        it "is true" do
          expect(board.free?(0,0)).to eq(true)
        end
      end
      context "when there is a token" do
        before { board.move(0,0,'X') }
        it "is false" do
          expect(board.free?(0,0)).to eq(false)
        end
      end
    end
    describe ".empty?" do
      context "when it's empty" do
        it "is true" do
          expect(board.empty?).to be(true)
        end
      end
      context "when it's not empty" do
        before { board.move(0,0,'X') }
        it "is false" do
          expect(board.empty?).to be(false)
        end
      end
    end

    describe ".full?" do
      context "when it's empty" do
        it "is false" do
          expect(board.full?).to eq(false)
        end
      end
      context "when it has some free moves" do
        before do
          board.move(0,0,'X')
          board.move(2,0,'X')
        end
        it "is false" do
          expect(board.full?).to eq(false)
        end
      end
      context "when it has no free moves" do
        before do
          board.move(0,0,'X')
          board.move(0,1,'X')
          board.move(0,2,'X')
          board.move(1,0,'X')
          board.move(1,1,'X')
          board.move(1,2,'X')
          board.move(2,0,'X')
          board.move(2,1,'X')
          board.move(2,2,'X')
        end
        it "is true" do
          expect(board.full?).to eq(true)
        end
      end
    end

    describe ".set_coords" do
      it "contains all sets of coordinates" do
        expect(board.set_coords).to eq([ # rows
                                        [[0,0],[0,1],[0,2]],
                                        [[1,0],[1,1],[1,2]],
                                        [[2,0],[2,1],[2,2]],
                                        # cols
                                        [[0,0],[1,0],[2,0]],
                                        [[0,1],[1,1],[2,1]],
                                        [[0,2],[1,2],[2,2]],
                                        # diags
                                        [[0,0],[1,1],[2,2]],
                                        [[0,2],[1,1],[2,0]]])
      end
    end

    describe ".winner" do
      context "when there's no winner" do
        it "is nil" do
          expect(board.winner).to eq(nil)
        end
      end
      context "when someone has won" do
        context "via horizontal" do
          before do
            board.move(0,0,'X')
            board.move(0,1,'X')
            board.move(0,2,'X')
          end
          it "is that token" do
            expect(board.winner).to eq('X')
          end
        end
        context "via vertical" do
          before do
            board.move(0,0,'O')
            board.move(1,0,'O')
            board.move(2,0,'O')
          end
          it "is that token" do
            expect(board.winner).to eq('O')
          end
        end
        context "via diagonal" do
          before do
            board.move(0,0,'X')
            board.move(1,1,'X')
            board.move(2,2,'X')
          end
          it "is that token" do
            expect(board.winner).to eq('X')
          end
        end
      end
    end

    describe ".end?" do
      context "when the board has no free moves" do
        before do
          board.move(0,0,'X')
          board.move(0,1,'X')
          board.move(0,2,'X')
          board.move(1,0,'X')
          board.move(1,1,'X')
          board.move(1,2,'X')
          board.move(2,0,'X')
          board.move(2,1,'X')
          board.move(2,2,'X')
        end
        it "is true" do
          expect(board.end?).to eq(true)
        end
      end

      context "when there's a winner" do
        before do
          board.move(0,0,'X')
          board.move(1,1,'X')
          board.move(2,2,'X')
        end
        it "is true" do
          expect(board.end?).to eq(true)
        end
      end

      context "when nobody has won, and there are move moves" do
        it "is false" do
          expect(board.end?).to eq(false)
        end
      end
    end

    context "on a 3x3 board" do
      subject(:board) { Board.new(3,3) }

      it "is a 3x3" do
        expect(board.width).to eq(3)
        expect(board.height).to eq(3)
      end

      describe ".cell_coords" do
        it "has all coordinates" do
          expect(board.cell_coords).to eq([[0,0],[0,1],[0,2],
                                           [1,0],[1,1],[1,2],
                                           [2,0],[2,1],[2,2]])
        end
      end
      describe ".sets" do
        it "has 8 winning sets" do
          expect(board.sets.length).to eq(8)
        end
      end
    end
    context "on a 4x4 board" do
      subject(:board) { Board.new(4,4) }

      it "is a 4x4" do
        expect(board.width).to eq(4)
        expect(board.height).to eq(4)
      end

      describe ".cell_coords" do
        it "has all coordinates" do
          expect(board.cell_coords).to eq([[0,0],[0,1],[0,2],[0,3],
                                           [1,0],[1,1],[1,2],[1,3],
                                           [2,0],[2,1],[2,2],[2,3],
                                           [3,0],[3,1],[3,2],[3,3]])
        end
      end
      
      describe ".sets" do
        it "has 10 winning sets" do
          expect(board.sets.length).to eq(10)
        end
      end
    end
  end
end
