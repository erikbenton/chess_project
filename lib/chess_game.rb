require_relative './models/pawn.rb'
require_relative './models/rook.rb'
require_relative './models/knight.rb'
require_relative './models/bishop.rb'
require_relative './models/queen.rb'
require_relative './models/king.rb'
require_relative './models/chessboard.rb'
require_relative './models/player.rb'

class Game

	attr_accessor :board, :player1, :player2

	def initialize
		@board = Chessboard.new

		@player1 = Player.new("white", @board)
		@player2 = Player.new("black", @board)

		self.instructions

		puts @board.draw_board

	end

	def instructions
		puts "A list of instructions"

	end

	def ask_for_move

		puts "What piece would you like to move?"
		piece_coords = gets.chomp.gsub(/\D+/, "").split("")
		piece_coords.map! { |coord| coord.to_i-1 }

		if @board.get_spot_contents(piece_coords) != " "
			puts @board.get_spot_contents(piece_coords).class.name
		end

		puts "And where would you like to move it?"
		final_coords = gets.chomp.gsub(/\D+/, "").split("")
		final_coords.map! { |coord| coord.to_i-1 }

		return piece_coords, final_coords
	end

end

game = Game.new

move = game.ask_for_move

puts game.player1.make_move(move[0], move[1])[1]

puts game.board.draw_board