require_relative 'piece.rb'

class King < Piece
	attr_accessor :position

	def initialize(position, color)
		@position = position
		@color = color
		@position_changes = [[1,1],[1,0],[-1,0],[0,1],[0,-1],[-1,1],[-1,-1],[1,-1]]
		@possible_moves = self.calc_moves
		
		if(@color == "white")
			@icon = "\u2654"
		else
			@icon = "\u265A"
		end
	end

end