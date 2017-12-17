class Piece

	attr_accessor :position

	@@position_changes = []

	def initialize(position)
		@position = position
		@position_changes = []
	end

	def calc_moves

		possible_moves = []

		@position_changes.each do |change|
			new_position = []
			new_position.push(@position[0] + change[0])
			new_position.push(@position[1] + change[1])
			if (new_position[0] >= 0 && new_position[1] >= 0) && new_position[0] <= 8 && new_position[1] <= 8
				possible_moves.push(new_position)
			end
		end
		return possible_moves
	end

end