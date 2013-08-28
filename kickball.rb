#!/usr/bin/env ruby
# encoding: UTF-8

require 'pry'

def identify_winner(team_one_name, team_one_score, team_two_name, team_two_score)

  if team_one_score > team_two_score
    team_one_name
  elsif team_one_score < team_two_score
    team_two_name
  end

end

all_games = []


input = ""

while input != "N"

  individual_game = []

  puts "What was team 1's name?"
  individual_game[0] = gets.chomp

  puts "What was team 1's score?"
  individual_game[1] = gets.chomp

  puts "What was team 2's name?"
  individual_game[2] = gets.chomp

  puts "What was team 2's score?"
  individual_game[3] = gets.chomp

  all_games << individual_game

  puts "Would you like to provide another game? (Y/N)"
  input = gets.chomp.upcase
  puts

end

all_games. each_with_index do |game, index|
  winner = identify_winner(game[0], game[1], game[2], game[3])
  puts "In game #{index + 1}, #{winner} is the victor!"
end

