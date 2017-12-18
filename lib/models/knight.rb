require_relative 'piece.rb'
require_relative 'chessboard.rb'

class Knight < Piece
	attr_accessor :position

	def initialize(position, color, board)
		@position = position
		@color = color
		@board = board
		@position_changes = [[1,2], [-1,-2], [-1,2], [1,-2], [2,1], [-2,-1], [-2,1], [2,-1]]
		@possible_moves = self.calc_moves
		if(@color == "white")
			@icon = "\u2658"
		else
			@icon = "\u265E"
		end
	end

	def calc_moves
		possible_moves = []

		@position_changes.each do |change|
			new_position = []
			new_position.push(@position[0] + change[0])
			new_position.push(@position[1] + change[1])
			next if @board.get_spot_contents(new_position) != " "
			if (new_position[0] >= 0 && new_position[1] >= 0) && (new_position[0] < 8 && new_position[1] < 8)
				possible_moves.push([new_position[0],new_position[1]])
			end
		end
		return possible_moves
	end

end