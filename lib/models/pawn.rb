require_relative 'piece.rb'

class Pawn < Piece
	attr_accessor :position

	def initialize(position, color)
		@position = position
		@color = color
		@position_changes = [[1,0]]
		@possible_moves = self.calc_moves
		if(@color == "white")
			@icon = "\u2659"
		else
			@icon = "\u265F"
		end
	end

end