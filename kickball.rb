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

def collect_answer(team_number, type, position, destination)
  puts "What was team #{team_number}'s #{type}?"
  destination[position] = gets.chomp
end


all_games = []
input = ""

while input != "N"
  individual_game = []

  collect_answer(1, "name", 0, individual_game)
  collect_answer(1, "score", 1, individual_game)
  collect_answer(2, "name", 2, individual_game)
  collect_answer(2, "score", 3, individual_game)

  all_games << individual_game

  puts "Would you like to provide another game? (Y/N)"
  input = gets.chomp.upcase
  puts

end




all_games. each_with_index do |game, index|
  winner = identify_winner(game[0], game[1], game[2], game[3])
  puts "In game #{index + 1}, #{winner} is the victor!"
end

