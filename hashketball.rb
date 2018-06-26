require "pry"

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        }, {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        }, {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        }, {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        }, {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        }, {
          player_name: "Bismak Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        }, {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        }, {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        }, {
          player_name: "Brendan Haywood",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

def get_all_players
  array_of_player_hashes = game_hash.values.map do |team|
    team[:players]
  end
  array_of_player_hashes.flatten
end

def get_player(player_name)
   get_all_players.find(player_name) do |player|
     player[:player_name] == player_name
   end
end

def num_points_scored(player_name)
  get_player(player_name)[:points]
end


def shoe_size(player_name)
  get_player(player_name)[:shoe]
end

def find_team(team_name)
  team_data = game_hash.values.select do |team|
    team[:team_name] == team_name
  end
  team_data[0]
end


def team_colors(team_name)
  find_team(team_name)[:colors]
end

def team_names
  game_hash.values.map do |team|
    team[:team_name]
  end
end

def player_numbers(name_of_team)
  find_team(name_of_team)[:players].map do |player|
    player[:number]
  end
end

def player_stats(player_name)
  get_player(player_name)
end

def big_shoe_rebounds
  largest_shoe_size = 0
  player_with_biggest_shoes_number_of_rebounds = nil
  get_all_players.each do |player|
    if player[:shoe] > largest_shoe_size
      largest_shoe_size = player[:shoe]
      player_with_biggest_shoes_number_of_rebounds = player[:rebounds]
    end
  end
  player_with_biggest_shoes_number_of_rebounds
end

def most_points_scored
  highest_point_total = 0
  player_with_most_points = ""
  get_all_players.each do |player|
    if player[:points] > highest_point_total
      highest_point_total = player[:points]
      player_with_most_points = player[:player_name]
    end
  end
  player_with_most_points
end

def winning_team
  team_total_score = 0
  team_with_highest_score = ""
  array_of_teams = game_hash.values
   array_of_teams.each do |team|
    if team[:players].map {|player| player[:points]}.sum > team_total_score
      team_total_score = team[:players].map {|player| player[:points]}.sum
      team_with_highest_score = team[:team_name]
    end
  end
  team_with_highest_score
end

def player_with_longest_name
  longest_player_name = ""
  get_all_players.each do |player|
    if player[:player_name].size > longest_player_name.size
      longest_player_name = player[:player_name]
    end
  end
  longest_player_name
end

def most_steals
  highest_steal_total = 0
  player_with_most_steals = ""
  get_all_players.each do |player|
    if player[:steals] > highest_steal_total
      highest_steal_total = player[:steals]
      player_with_most_steals = player[:player_name]
    end
  end
  player_with_most_steals
end

def long_name_steals_a_ton?
  player_with_longest_name == most_steals
end
