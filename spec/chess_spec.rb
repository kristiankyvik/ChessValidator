class ChessValidator

	def initialize(board)
		@board=board
	end

	def check_moves(move = false)
		if @board.empty?
			return ['ILLEGAL']
		end
		move.map do |from, to|
			from, to = from.split('')[1].to_i, to.split('')[1].to_i
			checkPawn(from,to)
		end
	end
end

def checkPawn(from, to)
	if from == 2
		to - from > 2 ? 'ILLEGAL' : 'LEGAL'
	else
		to - from > 1 ? 'ILLEGAL' : 'LEGAL'
	end
end

describe "Chess Validator" do

	it "all moves are illegal if there are no pieces" do
		expect(ChessValidator.new({}).check_moves).to eq(['ILLEGAL'])
	end

	it 'the board has one white pawn and moves one step' do
		board = {
			'a2'=>'wP',
			'a3' => '--'
		}

		moves = {
			'a2'=>'a3'
		}

		expect(ChessValidator.new(board).check_moves(moves)).to eq(['LEGAL'])
	end

	it 'the board has two white pawns and both of them move one step' do
		board = {
			'a2'=>'wP',
			'a3' => '--',
			'b2'=>'wP',
			'b3' => '--'
		}

		moves = {
			'a2'=>'a3',
			'b2'=>'b3'
		}
		expect(ChessValidator.new(board).check_moves(moves)).to eq(['LEGAL', 'LEGAL'])
	end

	it 'the board has two pawns and one of them makes an illegal move' do
		board = {
			'a2'=>'wP',
			'a3' => '--',
			'b2'=>'wP',
			'b3' => '--'
		}

		moves = {
			'a2'=>'a5',
			'b2'=>'b3'
		}
		expect(ChessValidator.new(board).check_moves(moves)).to eq(['ILLEGAL', 'LEGAL'])
	end

	it 'the board has two pawns and both of them make and illegal move' do
		board = {
			'a2'=>'wP',
			'a3' => '--',
			'b3'=>'wP',
			'b5' => '--'
		}

		moves = {
			'a2'=>'a5',
			'b3'=>'b5'
		}
		expect(ChessValidator.new(board).check_moves(moves)).to eq(['ILLEGAL', 'ILLEGAL'])
	end

	it 'the board has one pawn trying to move to an occupied position' do
		board = {
			'b3'=>'wP',
			'b4'=> 'wP'
		}

		moves = {
			'b3'=>'b4'
		}
		expect(ChessValidator.new(board).check_moves(moves)).to eq(['ILLEGAL'])
	end

end
