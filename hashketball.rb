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

def num_points_scored(player)
   nets_players = game_hash[:home][:players].keys
   hornets_players = game_hash[:away][:players].keys
   if nets_players.include?(player)
     game_hash[:home][:players][player][:points]
   elsif hornets_players.include?(player)
     game_hash[:away][:players][player][:points]
   else nil
   end
end

def shoe_size(player)
  nets_players = game_hash[:home][:players].keys
  hornets_players = game_hash[:away][:players].keys
  if nets_players.include?(player)
    game_hash[:home][:players][player][:shoe]
  elsif hornets_players.include?(player)
    game_hash[:away][:players][player][:shoe]
  else nil
  end
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
    game_hash[:home][:players].each do |player_name, values|
      numbers_array << values[:number]
    end
  else
    game_hash[:away][:players].each do |player_name, values|
      numbers_array << values[:number]
    end
  end
  numbers_array
end

def player_stats(player)
  nets_players = game_hash[:home][:players].keys
  hornets_players = game_hash[:away][:players].keys
  if nets_players.include?(player)
    game_hash[:home][:players][player]
  else
    game_hash[:away][:players][player]
  end
end

def big_shoe_rebounds
  nets_players = game_hash[:home][:players]
  hornets_players = game_hash[:away][:players]
  all_players = game_hash[:home][:players].merge(hornets_players)
  biggest_shoe_player = all_players.max_by do |player_name, values|
    values[:shoe]
  end
  return biggest_shoe_player[1][:rebounds]
end
