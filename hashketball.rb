require "pry"

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      }
    },
    :away => {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      }
    }
  }
end

def num_points_scored(player_name)
  player_points = nil
  game_hash.each do |team, team_data|
    team_data.each do |data_category, data|
      if data_category == :players
        data.each do |player, player_stats|
          if player == player_name
            player_stats.each do |stat_category, value|
              if stat_category == :points
                player_points = value
              end
            end
          end
        end
      end
    end
  end
  player_points
end

def shoe_size(player_name)
  player_shoe_size = nil
  game_hash.each do |team, team_data|
    team_data.each do |data_category, data|
      if data_category == :players
        data.each do |player, player_stats|
          if player == player_name
            player_stats.each do |stat_category, value|
              if stat_category == :shoe
                player_shoe_size = value
              end
            end
          end
        end
      end
    end
  end
  player_shoe_size
end

def team_colors(team_name)
  colors = []
  game_hash.each do |team, team_data|
    if team_data.values.include?(team_name)
      colors = game_hash[team][:colors]
    end
  end
  colors
end

def team_names
  teams = []
  game_hash.each do |team, team_data|
    team_data.each do |data_category, data|
      if data_category == :team_name
        teams << data
      end
    end
  end
  teams
end

def player_numbers(name_of_team)
  player_jersey_numbers = []
  game_hash.each do |team, team_data|
    if team_data.values_at(:team_name) == [name_of_team]
      team_data.each do |data_category, data|
        if data_category == :players
          data.each do |player, player_stats|
            player_stats.each do |stat_category, value|
              if stat_category == :number
                player_jersey_numbers << value
              end
            end
          end
        end
      end
    end
  end
  player_jersey_numbers
end

def player_stats(player_name)
  stats = {}
  game_hash.each do |team, team_data|
    team_data.each do |data_category, data|
      if data_category == :players
        data.each do |player, player_stats|
          if player == player_name
            stats = player_stats
          end
        end
      end
    end
  end
  stats
end

def big_shoe_rebounds
  biggest_shoe_size = 0
  player_with_biggest_shoes_rebounds = nil
  game_hash.each do |team, team_data|
    team_data.each do |data_category, data|
      if data_category == :players
        data.each do |player, player_stats|
          if player_stats.values_at(:shoe)[0] > biggest_shoe_size
            biggest_shoe_size = player_stats.values_at(:shoe)[0]
            player_with_biggest_shoes_rebounds = player_stats.values_at(:rebounds)[0]
          end
        end
      end
    end
  end
  player_with_biggest_shoes_rebounds
end

def most_points_scored
  most_points_total = 0
  player_with_most_points = nil
  game_hash.each do |team, team_data|
    team_data.each do |data_category, data|
      if data_category == :players
        data.each do |player, player_stats|
          if player_stats.values_at(:points)[0] > most_points_total
            most_points_total = player_stats.values_at(:points)[0]
            player_with_most_points = player
          end
        end
      end
    end
  end
  player_with_most_points
end

def winning_team
  brooklyn_nets_total = 0
  charlotte_hornets_total = 0
  winner = ""
  game_hash[:home][:players].each_value do |stat|
    brooklyn_nets_total += stat.values_at(:points)[0]
  end
  game_hash[:away][:players].each_value do |stat|
    charlotte_hornets_total += stat.values_at(:points)[0]
  end
  if brooklyn_nets_total > charlotte_hornets_total
    winner = "Brooklyn Nets"
  else
    winner = "Charlotte Hornets"
  end
  winner
end

def player_with_longest_name
  longest_name = ""
  game_hash.each do |team, team_data|
    team_data.each do |data_category, data|
      if data_category == :players
        data.each_key do |player|
          if player.size > longest_name.size
            longest_name = player
          end
        end
      end
    end
  end
  longest_name
end

def most_steals
  most_steals_total = 0
  player_with_most_steals = ""
  game_hash.each do |team, team_data|
    team_data.each do |data_category, data|
      if data_category == :players
        data.each do |player, player_stats|
          if player_stats.values_at(:steals)[0] > most_steals_total
            player_with_most_steals = player
          end
        end
      end
    end
  end
  player_with_most_steals
end

def long_name_steals_a_ton?
  player_with_longest_name == most_steals
end
