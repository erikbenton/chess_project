require_relative 'pawn.rb'
require_relative 'rook.rb'
require_relative 'knight.rb'
require_relative 'bishop.rb'
require_relative 'queen.rb'
require_relative 'king.rb'

class Player

	attr_accessor :pieces

	def initialize(color)
		@color = color
		@pieces = clean_start
	end

	def clean_start
		pieces = {}

		pieces = {"rook1" => Rook.new([0,0], @color.to_s),
							"knight1" => Knight.new([0,1], @color.to_s),
							"bishop1" => Bishop.new([0,2], @color.to_s),
							"king" => King.new([0,3], @color.to_s),
							"queen" => Queen.new([0,4], @color.to_s),
							"knight2" => Knight.new([0,5], @color.to_s),
							"bishop2" => Bishop.new([0,6], @color.to_s),
							"rook2" => Rook.new([0,7], @color.to_s),
							"pawn1" => Pawn.new([1,0], @color.to_s),
							"pawn2" => Pawn.new([1,1], @color.to_s),
							"pawn3" => Pawn.new([1,2], @color.to_s),
							"pawn4" => Pawn.new([1,3], @color.to_s),
							"pawn5" => Pawn.new([1,4], @color.to_s),
							"pawn6" => Pawn.new([1,5], @color.to_s),
							"pawn7" => Pawn.new([1,6], @color.to_s),
							"pawn8" => Pawn.new([1,7], @color.to_s)}

	if @color == "black"
		pieces.each do |name, piece|
			if piece.class.name == "Pawn"
				piece.position[0] = piece.position[0] + 5
			else
				piece.position[0] = piece.position[0] + 7
			end		
		end
	end
	return pieces
	end

end