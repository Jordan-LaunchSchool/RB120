=begin
Tic Tac Toe is a 2-player board game played on a 3x3 grid. Players take turns
marking a square. The first player to mark 3 squares in a row wins.

Nouns: board, player, square, grid
Verbs: play, mark

Board
Square
Player
- mark
- play


=end

require 'pry'

class Board
	WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
	[[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
	[[1, 5, 9], [3, 5, 7]]              # diagonals

	
	def initialize
		@squares = {} 
		(1..9).each {|key| @squares[key] = Square.new}
	end

	def get_square_at(key)
		@squares[key]
	end

	def set_square_at(key, marker)
		@squares[key].marker = marker
	end

	def unmarked_keys
		@squares.keys.select { |key| @squares[key].unmarked? }
	end

	def full?
		unmarked_keys.empty?
	end

	def someone_won?
		!!detect_winner
	end

	# return winning marker or return nil
	def detect_winner
		WINNING_LINES.each do |line|
			if @squares[line[0]].marker == TTTGame::HUMAN_MARKER && @squares[line[1]].marker == TTTGame::HUMAN_MARKER &&
				 @squares[line[2]].marker == TTTGame::HUMAN_MARKER
				 return TTTGame::HUMAN_MARKER
			elsif @squares[line[0]].marker == TTTGame::COMPUTER_MARKER && @squares[line[1]].marker == TTTGame::COMPUTER_MARKER &&
						@squares[line[2]].marker == TTTGame::COMPUTER_MARKER
						return TTTGame::COMPUTER_MARKER
			end
		end
		nil
	end

end

class Square
	INITIAL_MARKER = " "

	attr_accessor :marker

	def initialize(marker=INITIAL_MARKER)
		@marker = marker
	end

	def to_s
		@marker
	end

	def unmarked?
		marker == INITIAL_MARKER
	end
	
end

class Player
	attr_reader :marker

	def initialize(marker)
		@marker = marker
	end


	def play

	end
end

class TTTGame
	HUMAN_MARKER = 'X'
	COMPUTER_MARKER = 'O'

	attr_reader :board, :human, :computer

	def initialize
		@board = Board.new
		@human = Player.new(HUMAN_MARKER)
		@computer = Player.new(COMPUTER_MARKER)
	end

	def display_welcome_message
		puts "Welcome to Tic Tac Toe!"
		puts ""
	end
5
	def display_goodbye_message
		puts "Thanks for playing Tic Tac Toe! Goodbye!"
	end

	def display_board
		system 'clear'
		puts "You're a #{human.marker}. The computer is a #{computer.marker}."
		puts ""
		puts "     |     |"
		puts "  #{board.get_square_at(1)}  |  #{board.get_square_at(2)}  |  #{board.get_square_at(3)}"
		puts "     |     |"
		puts "-----|-----|-----"
		puts "     |     |"
		puts "  #{board.get_square_at(4)}  |  #{board.get_square_at(5)}  |  #{board.get_square_at(6)}"
		puts "     |     |"
		puts "-----|-----|-----"
		puts "     |     |"
		puts "  #{board.get_square_at(7)}  |  #{board.get_square_at(8)}  |  #{board.get_square_at(9)}"
		puts "     |     |"
		puts ""
	end

	def human_moves
		puts "Choose a square between #{board.unmarked_keys.join(', ')}:"
		square = nil
		loop do
			square = gets.chomp.to_i
			break if board.unmarked_keys.include?(square)
			puts "Sorry, that's not a valid choice."
		end

		board.set_square_at(square, human.marker)
	end

	def computer_moves
		board.set_square_at(board.unmarked_keys.sample, computer.marker)
	end

	def display_result
		display_board

		case board.detect_winner
		when human.marker
			puts "You won!"
		when computer.marker
			puts "Computer won!"
		else
			puts "It's a tie!"
		end

	end

	def play
		display_welcome_message
		display_board

		loop do
			human_moves
			break if board.someone_won? || board.full?

			computer_moves
			break if board.someone_won? || board.full?

			display_board
			#break if someone_won? || board_full?
		end
		# display_result
		display_goodbye_message
	end
end

game = TTTGame.new
game.play
