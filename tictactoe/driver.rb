#!/usr/bin/ruby
require_relative './board'

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

b = TicTacToe::Board.new
