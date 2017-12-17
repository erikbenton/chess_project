require_relative 'piece.rb'

class Rook < Piece
	attr_accessor :position

	def initialize(position, color)
		@position = position
		@color = color
		@position_changes = [[1,0],[2,0],[3,0],[4,0],[5,0],[6,0],[7,0],[8,0],
												[-1,0],[-2,0],[-3,0],[-4,0],[-5,0],[-6,0],[-7,0],[-8,0],
												[0,1],[0,2],[0,3],[0,4],[0,5],[0,6],[0,7],[0,8],
												[0,-1],[0,-2],[0,-3],[0,-4],[0,-5],[0,-6],[0,-7],[0,-8]]		
	end

end