class Chessboard

	def initialize
		@board = self.empty_board
	end

	def empty_board
		board = []
		(0..7).each do |row|
			col = []
			(0..7).each { col.push(" ") }
			board.push(col)
		end
		return board
	end

	def add_piece(piece)
		@board[piece.position[0]][piece.position[1]] = piece
	end
end