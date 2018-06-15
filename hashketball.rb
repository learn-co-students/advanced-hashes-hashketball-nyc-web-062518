# Write your code here!
require "pry"
def game_hash
  game = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black","White"],
      :players => {
        "Alan Anderson" => {:number => 0, :shoe => 16, :points => 22, :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1},
        "Reggie Evans" => {:number => 30, :shoe => 14, :points => 12, :rebounds => 12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7},
        "Brook Lopez" => {:number => 11, :shoe => 17, :points => 17, :rebounds => 19, :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15},
        "Mason Plumlee" => {:number => 1, :shoe => 19, :points => 26, :rebounds => 12, :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5},
        "Jason Terry" => {:number => 31, :shoe => 15, :points => 19, :rebounds => 2, :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1}
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise","Purple"],
      :players => {
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
  nets_roster = game_hash[:home][:players].keys
  hornets_roster = game_hash[:away][:players].keys
  if nets_roster.include?(player)
    game_hash[:home][:players][player][:points]
  else
    game_hash[:away][:players].each do |hooper, stats|
              #binding.pry
      if hooper == player
        return stats[:points]

      end
    end
  end
end

def shoe_size(player)
  foot = nil
  nets_roster = game_hash[:home][:players].keys
  hornets_roster = game_hash[:away][:players].keys
  if nets_roster.include?(player)
    game_hash[:home][:players].each do |hooper, stats|
      if hooper == player
        foot = game_hash[:home][:players][player][:shoe]
      end
    end
    else
      game_hash[:away][:players].each do |hooper, stats|
        if hooper == player
          foot = game_hash[:away][:players][player][:shoe]
          #binding.pry
        end
      end
  end
  foot.to_i
end

def team_colors(team)
  if game_hash[:home][:team_name] == team
    game_hash[:home][:colors]
  else
    game_hash[:away][:colors]
  end
end

def team_names
  names = []
  game_hash.each do |origin, data|
    data.each do |key, info|
      if key == :team_name
        names << info
      end
    end
  end
  names
end

def player_numbers(team)
  nets_roster = game_hash[:home][:players].keys
  hornets_roster = game_hash[:away][:players].keys
  jerseys = []
  if team == game_hash[:home][:team_name]
    game_hash[:home][:players].each do |player, stats|
      jerseys << stats[:number].to_i
    end
  else
    game_hash[:away][:players].each do |player, stats|
      jerseys << stats[:number].to_i
    end
  end
  jerseys
end

def player_stats(player)
  nets_roster = game_hash[:home][:players].keys
  hornets_roster = game_hash[:away][:players].keys
  if nets_roster.include?(player)
    game_hash[:home][:players][player]
  else
    game_hash[:away][:players][player]
  end
end

def big_shoe_rebounds
  hornets = game_hash[:away][:players]
  nets = game_hash[:home][:players]
  all_players = hornets.merge(nets)
  sorted_players = all_players.sort_by {|key, stats| stats[:shoe]}
  bigfoot = sorted_players[-1]
  bigfoot_rebounds = nil
  bigfoot[1][:rebounds]
end
