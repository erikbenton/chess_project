require_relative 'piece.rb'

class King < Piece
	attr_accessor :position

	def initialize(position)
		@position = position
		@position_changes = [[1,1],[1,0],[-1,0],[0,1],[0,-1],[-1,1],[-1,-1],[1,-1]]
	end

end