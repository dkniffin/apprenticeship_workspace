#!/usr/bin/ruby
require_relative './board'
require_relative './ai'

# Determine the player's token
playerToken = nil
while playerToken.nil?
  $stdout.print "Would you like to go first (y/n)? "
  input = gets.chomp
  if input.downcase == 'y'
    playerToken = 'X'
  elsif input.downcase == 'n'
    playerToken = 'O'
  else
    puts "Invalid response."
  end
end

# Set up the board
b = TicTacToe::Board.new

# Set up the AI
aiToken = (playerToken == 'X') ? 'O' : 'X'
ai = TicTacToe::AI.new(aiToken,playerToken)

if aiToken == 'X'
  ai.move(b)
end

puts b
puts

# Game REPL
prompt = "Your move: "
loop do
  # Base case: check if the game is over
  if b.end?
    winner = b.winner
    result_msg = winner.nil? ? 'Tie.' : "#{winner} wins!"
    puts "Game over! #{result_msg}"
    exit
  end
  $stdout.print(prompt)
  input = gets.chomp # Get user input

	pos = input.to_i
	if ! pos.between?(0,8)
		puts "Invalid input. Input should be a number 0-8."
		puts b
		next
	end
	x,y = b.cell_coords[pos]

	if b.free?(x,y)
		b.move(x,y,playerToken)
		unless b.end?
			ai.move(b)
		end
	else
		puts "Invalid move! Try again."
	end
  	puts b # Print the board
end
