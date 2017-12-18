require_relative 'piece.rb'

class Bishop < Piece
	attr_accessor :position

	def initialize(position, color)
		@position = position
		@color = color
		@position_changes = [[1,1],[2,2],[3,3],[4,4],[5,5],[6,6],[7,7],[8,8],
												[-1,1],[-2,2],[-3,3],[-4,4],[-5,5],[-6,6],[-7,7],[-8,8],
												[1,-1],[2,-2],[3,-3],[4,-4],[5,-5],[6,-6],[7,-7],[8,-8],
												[-1,-1],[-2,-2],[-3,-3],[-4,-4],[-5,-5],[-6,-6],[-7,-7],[-8,-8]]
		@possible_moves = self.calc_moves
		if(@color == "white")
			@icon = "\u2657"
		else
			@icon = "\u265D"
		end		
	end

end