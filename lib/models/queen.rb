require_relative 'piece.rb'
require_relative 'chessboard.rb'

class Queen < Piece
	attr_accessor :position

	def initialize(position, color, board, player)
		@position = position
		@color = color
		@board = board
		@player = player
		@position_changes = [[[1,0],[2,0],[3,0],[4,0],[5,0],[6,0],[7,0],[8,0]],
												[[-1,0],[-2,0],[-3,0],[-4,0],[-5,0],[-6,0],[-7,0],[-8,0]],
												[[0,1],[0,2],[0,3],[0,4],[0,5],[0,6],[0,7],[0,8]],
												[[0,-1],[0,-2],[0,-3],[0,-4],[0,-5],[0,-6],[0,-7],[0,-8]],
												[[1,1],[2,2],[3,3],[4,4],[5,5],[6,6],[7,7],[8,8]],
												[[-1,1],[-2,2],[-3,3],[-4,4],[-5,5],[-6,6],[-7,7],[-8,8]],
												[[1,-1],[2,-2],[3,-3],[4,-4],[5,-5],[6,-6],[7,-7],[8,-8]],
												[[-1,-1],[-2,-2],[-3,-3],[-4,-4],[-5,-5],[-6,-6],[-7,-7],[-8,-8]]]
		@possible_moves = self.calc_moves
		if(@color == "white")
			@icon = "\u2655"
		else
			@icon = "\u265B"
		end
	end

	def calc_moves
		possible_moves = []

		@position_changes.each do |path|
			path.each do |change|
				new_position = []
				if @color == "white"
					new_position.push(@position[0] + change[0])
					new_position.push(@position[1] + change[1])
				else
					new_position.push(@position[0] - change[0])
					new_position.push(@position[1] - change[1])
				end
				new_spot = @board.get_spot_contents(new_position)
				if new_spot != false && new_spot != " "
					if new_spot.color != @color
						possible_moves.push(new_position)
					end
					break
				end
				if (new_position[0] >= 0 && new_position[1] >= 0) && new_position[0] < 8 && new_position[1] < 8
					possible_moves.push(new_position)
				end
			end
		end
		return possible_moves
	end

end