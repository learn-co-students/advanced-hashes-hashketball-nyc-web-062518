require "pry"

# Write your code here!
def game_hash
  game_hash = {
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
    away: {
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

def good_practices
  game_hash.each do |location, team_data|
    binding.pry
      team_data.each do |attribute, data|
        binding.pry
        data.each do |data_item|
            binding.pry
      end
    end
  end
end

#good_practices 

def num_points_scored(players_name)
  output = nil
  game_hash.each do |location, data|
    data[:players].each do |name, attribute|
      if name == players_name
        output = data[:players][name][:points]
      end 
    end  
  end
  output
end  
      
def shoe_size(players_name)
  output = nil
  game_hash.each do |location, data|
    data[:players].each do |name, attribute|
      if name == players_name
        output = data[:players][name][:shoe]
      end 
    end  
  end
  output
end  

def team_colors(team_name)
  output = nil
  game_hash.each do |location, data|
    if data[:team_name] == team_name
      output = data[:colors]
    end 
  end
  output
end  

def team_names
  output = []
  game_hash.each do |location, data|
    output << data[:team_name]
  end
  output
end  

def player_numbers(team_name)
  output = []
  game_hash.each do |location, data|
    if data[:team_name] == team_name
      data[:players].each do |name, attribute|
        output << attribute[:number]
      end  
    end 
  end
  output
end  

def player_stats(players_name)
  output = {}
  game_hash.each do |location, data|
    data[:players].each do |name, attribute|
      if name == players_name
        output = attribute
      end  
    end
  end
  output
end  

def big_shoe_rebounds
  output = nil
  name_shoe = {}
  game_hash.each do |location, data|
    data[:players].each do |name, attribute|
      name_shoe[name] = attribute[:shoe]
    end
  end  
  biggest_shoe = name_shoe.values.sort.reverse[0]
  game_hash.each do |location, data|
    data[:players].each do |name, attribute|
      if attribute[:shoe] == biggest_shoe
        output = attribute[:rebounds]
      end  
    end
  end  
  output
end  