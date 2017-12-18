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

	def get_spot_contents(coords)
		return false if coords[0] < 0 || coords[1] < 0 || coords[0] > 7 || coords[1] > 7
		return @board[coords[0]][coords[1]]
	end

	def set_spot_contents(coords, new_content)
		@board[coords[0]][coords[1]] = new_content
	end

	def draw_board
		drawn_board = ""
		horizontal_divide = "   ----------------------------------------- \n"
		7.downto(0).each do |row|
			drawn_board += horizontal_divide + (row+1).to_s
			@board[row].each do |spot|
				if spot != " "
					drawn_board += "  | " + spot.icon.force_encoding('utf-8')
				else
					drawn_board += "  | " + spot
				end
			end
			drawn_board += "  |\n"
		end
		drawn_board += horizontal_divide
		drawn_board += "     1    2    3    4    5    6    7    8   \n"
		return drawn_board
	end
end