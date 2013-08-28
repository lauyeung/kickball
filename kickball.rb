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

input = ""

while input != "N"

  puts "What was team 1's name?"
  team_one_name = gets.chomp

  puts "What was team 1's score?"
  team_one_score = gets.chomp

  puts "What was team 2's name?"
  team_two_name = gets.chomp

  puts "What was team 2's score?"
  team_two_score = gets.chomp

  winner = identify_winner(team_one_name, team_one_score, team_two_name, team_two_score)

  puts "#{winner} is the victor!"
  puts
  puts "Would you like to provide another game? (Y/N)"
  input = gets.chomp.upcase
  puts

end
