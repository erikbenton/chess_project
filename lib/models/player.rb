require_relative 'pawn.rb'
require_relative 'rook.rb'
require_relative 'knight.rb'
require_relative 'bishop.rb'
require_relative 'queen.rb'
require_relative 'king.rb'
require_relative 'chessboard.rb'

class Player

	attr_accessor :pieces, :color

	def initialize(color, board)
		@color = color
		@board = board
		@pieces = clean_start
		
		@pieces.each do |name, piece|
			@board.add_piece(piece)
		end

		@pieces.each_value { |piece| piece.possible_moves = piece.calc_moves }
	
	end

	def clean_start
		pieces = {}

		pieces = {"rook1" => Rook.new([0,0], @color.to_s, @board, self),
							"knight1" => Knight.new([0,1], @color.to_s, @board, self),
							"bishop1" => Bishop.new([0,2], @color.to_s, @board, self),
							"king" => King.new([0,3], @color.to_s, @board, self),
							"queen" => Queen.new([0,4], @color.to_s, @board, self),
							"knight2" => Knight.new([0,5], @color.to_s, @board, self),
							"bishop2" => Bishop.new([0,6], @color.to_s, @board, self),
							"rook2" => Rook.new([0,7], @color.to_s, @board, self),
							"pawn1" => Pawn.new([1,0], @color.to_s, @board, self),
							"pawn2" => Pawn.new([1,1], @color.to_s, @board, self),
							"pawn3" => Pawn.new([1,2], @color.to_s, @board, self),
							"pawn4" => Pawn.new([1,3], @color.to_s, @board, self),
							"pawn5" => Pawn.new([1,4], @color.to_s, @board, self),
							"pawn6" => Pawn.new([1,5], @color.to_s, @board, self),
							"pawn7" => Pawn.new([1,6], @color.to_s, @board, self),
							"pawn8" => Pawn.new([1,7], @color.to_s, @board, self)}

		if @color == "black"
			pieces.each do |name, piece|
				if piece.class.name == "Pawn"
					piece.position[0] = piece.position[0] + 5
				else
					piece.position[0] = piece.position[0] + 7
				end		
			end
		end
		pieces.each_value { |piece| piece.possible_moves = piece.calc_moves }
		return pieces
	end

	def make_move(initial_coords, final_coords)
		
		message = ""

		# Find the piece at the initial coords
		piece = @board.get_spot_contents(initial_coords)

		if !piece || piece.color != @color
			message = "You do not have a piece there"
			return false, message
		end
		
		# See if piece can move to final coords
		unless piece.possible_moves.include? final_coords
			message = "You cannot move there"
			return false, message
		end

		# Check if opponent piece there
		if @board.get_spot_contents(final_coords)
			if @board.get_spot_contents(final_coords).color != @color
				opponent_piece = @board.get_spot_contents(final_coords)
				message = opponent_piece.class.name.downcase
				# If there is, remove opponents piece from game
				opponent = opponent_piece.player
				opponent.pieces.delete_if { |key, value| value == opponent_piece }
			end
		end
		
		piece.move_to(final_coords)
		@board.add_piece(piece)
		@board.set_spot_contents(initial_coords, " ")

		return true, message

	end

end