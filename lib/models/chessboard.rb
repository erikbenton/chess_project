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

	def draw_board
		drawn_board = ""
		horizontal_divide = " - - - - - - - - \n"
		(0..7).each do |row|
			drawn_board += horizontal_divide
			@board[row].each do |spot|
				if spot != " "
					drawn_board += "|" + spot.icon
				else
					drawn_board += "|" + spot
				end
			end
			drawn_board += "|\n"
		end

		drawn_board += horizontal_divide
		return drawn_board
	end
end