class Chessboard

	def initialize
		@board = self.empty_board
	end

	def empty_board
		board = []
		(0..7).each do |row|
			col = []
			(0..7).each do |spot|
				col.push(" ")
			end
			board.push(col)
		end
		return board
	end
end