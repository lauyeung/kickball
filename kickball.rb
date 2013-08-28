#!/usr/bin/env ruby
# encoding: UTF-8

require 'pry'

def identify_winner(team_one_name, team_one_score, team_two_name, team_two_score, league_destination)
  if league_destination[team_one_name].nil?
    league_destination[team_one_name] = []
  end
    if league_destination[team_two_name].nil?
    league_destination[team_two_name] = []
  end

  if team_one_score.to_i > team_two_score.to_i
    league_destination[team_one_name] << "w"
    league_destination[team_two_name] << "l"
    team_one_name

  elsif team_one_score.to_i < team_two_score.to_i
    league_destination[team_two_name] << "w"
    league_destination[team_one_name] << "l"
    team_two_name
  end
end

def collect_answer(team_number, type, position, destination)
  puts "What was team #{team_number}'s #{type}?"
  destination[position] = gets.chomp
end

def show_standings(league_data)
puts "*** League Standings ***"
league_data.each_with_index do | league_result, index |
  puts "#{index + 1} #{league_result[0]}: #{league_result[1]}W, #{league_result[2]}L"
  end
end

all_games = []
input = ""
league = {}
league_results = []



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

all_games.each_with_index do |game, index|
  winner = identify_winner(game[0], game[1], game[2], game[3], league)
  puts "In game #{index + 1}, #{winner} is the victor!"
end

league.each do | team_name, all_results |
  team_league_result = ["", 0, 0, 0]
  team_league_result[0] = team_name
  all_results.each do | win_loss |
    if win_loss == "w"
      team_league_result[1] += 1
    elsif win_loss == "l"
      team_league_result[2] += 1
    end
  end
  team_league_result[3] = team_league_result[1] - team_league_result[2]
  league_results << team_league_result
end


sorted_league_results = league_results.sort_by {|item| item[3] }.reverse

puts

standings = show_standings(sorted_league_results)

puts
puts "Would you like to export league standings? (Y/N)"
export_response = gets.chomp.upcase
if export_response == "Y"
  puts "Path to export to?"
  path_response = gets.chomp

  File.open(path_response, 'w') do |f|
  f.write standings
  puts
  puts "Data exported successfully..."
  end
end
puts
puts "Thanks for using The Greatest Kickball Tracker in Existence!"

