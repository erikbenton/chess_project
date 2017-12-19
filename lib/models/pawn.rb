require_relative 'piece.rb'
require_relative 'chessboard.rb'

class Pawn < Piece
	attr_accessor :position

	def initialize(position, color, board, player)
		@position = position
		@color = color
		@board = board
		@player = player
		@position_changes = [[1,0]]
		@possible_moves = self.calc_moves
		if(@color == "white")
			@icon = "\u2659"
		else
			@icon = "\u265F"
		end
	end

	def calc_moves
		possible_moves = []

		@position_changes.each do |change|
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
				next
			end
			if (new_position[0] >= 0 && new_position[1] >= 0) && new_position[0] < 8 && new_position[1] < 8
				possible_moves.push(new_position)
			end
		end
		return possible_moves
	end

end