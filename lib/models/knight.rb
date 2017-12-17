require_relative 'piece.rb'

class Knight < Piece
	attr_accessor :position

	def initialize(position)
		@position = position
		@position_changes = [[1,2], [-1,-2], [-1,2], [1,-2], [2,1], [-2,-1], [-2,1], [2,-1]]
	end

end