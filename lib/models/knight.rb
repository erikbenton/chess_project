require_relative 'piece.rb'

class Knight < Piece
	attr_accessor :position

	def initialize(position, color)
		@position = position
		@color = color
		@position_changes = [[1,2], [-1,-2], [-1,2], [1,-2], [2,1], [-2,-1], [-2,1], [2,-1]]
		@possible_moves = self.calc_moves
		if(@color == "white")
			@icon = "\u2658"
		else
			@icon = "\u265E"
		end
	end

end