require_relative 'piece.rb'

class Pawn < Piece
	attr_accessor :position

	def initialize(position)
		@position = position
		@position_changes = []
	end

end