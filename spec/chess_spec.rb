

class ChessValidator

	def initialize(board)
		@board=board
	end

	def check_moves(move = false)
		if @board.empty?
			return ['ILLEGAL']
		end
		move.map do |from, to|
			to.split('')[1].to_i - from.split('')[1].to_i > 2 ? 'ILLEGAL' : 'LEGAL'
		end
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

	it 'the board has two pawns and one of them make and illegal move' do
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
			'b2'=>'wP',
			'b3' => '--'
		}

		moves = {
			'a2'=>'a5',
			'b3'=>'b5'
		}
		expect(ChessValidator.new(board).check_moves(moves)).to eq(['ILLEGAL', 'ILLEGAL'])
	end















end
