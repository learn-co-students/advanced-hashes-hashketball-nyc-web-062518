require "pry"

def game_hash
  hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players  => {
        "Alan Anderson" => {:number => 0, :shoe => 16, :points => 22, :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1},
        "Reggie Evans" => {:number => 30, :shoe => 14, :points => 12, :rebounds => 12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7},
        "Brook Lopez" => {:number => 11, :shoe => 17, :points => 17, :rebounds => 19, :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15},
        "Mason Plumlee" => {:number => 1, :shoe => 19, :points => 26, :rebounds => 12, :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5},
        "Jason Terry" => {:number => 31, :shoe => 15, :points => 19, :rebounds => 2, :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1}
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players  => {
        "Jeff Adrien" => {:number => 4, :shoe => 18, :points => 10, :rebounds => 1, :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2},
        "Bismak Biyombo" => {:number => 0, :shoe => 16, :points => 12, :rebounds => 4, :assists => 7, :steals => 7, :blocks => 15, :slam_dunks => 10},
        "DeSagna Diop" => {:number => 2, :shoe => 14, :points => 24, :rebounds => 12, :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5},
        "Ben Gordon" => {:number => 8, :shoe => 15, :points => 33, :rebounds => 3, :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0},
        "Brendan Haywood" => {:number => 33, :shoe => 15, :points => 6, :rebounds => 12, :assists => 12, :steals => 22, :blocks => 5, :slam_dunks => 12}
      }
    }
  }
end

# One array containing a hash for each player:
# player => {all player stats}

def get_all_players
  array_of_players_hashes = game_hash.values.map do |team|
    team[:players]
  end
  array_of_players_hashes.flatten
end

# def num_points_scored(player)
#    nets_players = game_hash[:home][:players].keys
#    hornets_players = game_hash[:away][:players].keys
#    if nets_players.include?(player)
#      game_hash[:home][:players][player][:points]
#    elsif hornets_players.include?(player)
#      game_hash[:away][:players][player][:points]
#    else nil
#    end
# end

def num_points_scored(player)
  player_stats(player)[:points]
end

# def shoe_size(player)
#   nets_players = game_hash[:home][:players].keys
#   hornets_players = game_hash[:away][:players].keys
#   if nets_players.include?(player)
#     game_hash[:home][:players][player][:shoe]
#   elsif hornets_players.include?(player)
#     game_hash[:away][:players][player][:shoe]
#   else nil
#   end
# end

def shoe_size(player)
  player_stats(player)[:shoe]
end

def team_colors(team)
  if game_hash[:home][:team_name] == team
    game_hash[:home][:colors]
  else game_hash[:away][:colors]
  end
end

def team_names
  names_array = []
  game_hash.each do |team_type, data|
    data.each do |team_name, value|
      if team_name == :team_name
        names_array << value
      end
    end
  end
  names_array
end

def player_numbers(team)
  nets_players = game_hash[:home][:players].keys
  hornets_players = game_hash[:away][:players].keys
  numbers_array = []
  if team == game_hash[:home][:team_name]
    game_hash[:home][:players].each do |player, values|
      numbers_array << values[:number]
    end
  else
    game_hash[:away][:players].each do |player, values|
      numbers_array << values[:number]
    end
  end
  numbers_array
end

# def player_stats(player)
#   nets_players = game_hash[:home][:players].keys
#   hornets_players = game_hash[:away][:players].keys
#   if nets_players.include?(player)
#     game_hash[:home][:players][player]
#   else
#     game_hash[:away][:players][player]
#   end
# end

def player_stats(player)
  all_players = game_hash[:home][:players].merge(game_hash[:away][:players])
  all_players[player]
end

def big_shoe_rebounds
  nets_players = game_hash[:home][:players]
  hornets_players = game_hash[:away][:players]
  all_players = game_hash[:home][:players].merge(hornets_players)
  biggest_shoe_player = all_players.max_by do |player, values|
    values[:shoe]
  end
  return biggest_shoe_player[1][:rebounds]
end

def most_points_scored
  all_players = game_hash[:home][:players].merge(game_hash[:away][:players])
  highest_scorer = all_players.max_by do |player, values|
    values[:points]
  end
  highest_scorer[0]
end


def winning_team
  nets_points_array = game_hash[:home][:players].map do |player, values|
    values[:points]
  end
  hornets_points_array = game_hash[:away][:players].map do |player, values|
    values[:points]
  end
  nets_total = 0
  nets_points_array.each do |players_points|
    nets_total += players_points
  end
  hornets_total = 0
  hornets_points_array.each do |players_points|
    hornets_total += players_points
  end
  if nets_total > hornets_total
    "Brooklyn Nets"
  elsif nets_total < hornets_total
    "Charlotte Hornets"
  else return "A tie"
  end
end

def player_with_longest_name
  all_player_names = game_hash[:home][:players].merge(game_hash[:away][:players]).keys
  all_player_names.max_by(&:length)
end


def long_name_steals_a_ton?
  all_players = game_hash[:home][:players].merge(game_hash[:away][:players])
  highest_stealer = all_players.max_by do |player, values|
    values[:steals]
  end
  if highest_stealer[0] == player_with_longest_name
    true
  else false
  end
end
