# Write your code here!
require "pry"
def game_hash
  game = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
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
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {:number => 4, :shoe => 18, :points => 10, :rebounds => 1, :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2},
        "Bismak Biyombo" => {:number => 0, :shoe => 16, :points => 12, :rebounds => 4, :assists => 7, :steals => 7, :blocks => 15, :slam_dunks => 10},
        "DeSagna Diop" => {:number => 2, :shoe => 14, :points => 24, :rebounds => 12, :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5},
        "Ben Gordon" => {:number => 8, :shoe => 15, :points => 33, :rebounds => 3, :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0},
        "Brendan Haywood" => {:number => 33, :shoe => 15, :points => 6, :rebounds => 12, :assists => 12, :steals => 22, :blocks => 5, :slam_dunks => 12}
      }
    }
  }
  return game
end

def num_points_scored(name)
  game_hash().each do |location, teamData|
    teamData.each do |dataType, data|
      if dataType == :players
        data.each do |playerName, playerAttributes|
          if playerName == name
            playerAttributes.each do |valueType, value|
              if valueType == :points
                return value
              end
            end
          end
        end
      end
    end
  end
end

def shoe_size(name)
  game_hash().each do |location, teamData|
    teamData.each do |dataType, data|
      if dataType == :players
        data.each do |playerName, playerAttributes|
          if playerName == name
            playerAttributes.each do |valueType, value|
              if valueType == :shoe
                return value
              end
            end
          end
        end
      end
    end
  end
end

def team_colors(name)
  game_hash().each do |location, teamData|
    teamData.each do |dataType, data|
      if dataType == :team_name && data == name
        return game_hash()[location][:colors]
      end
    end
  end
end

def team_names
  teamNames = []
  game_hash().each do |location, teamData|
    teamData.each do |dataType, data|
      if dataType == :team_name
         teamNames.push(data)
      end
    end
  end
  return teamNames
end

def player_numbers(teamName)
  jerseyNumbers = []
  teamType = ""
  if game_hash()[:home][:team_name] == teamName
    teamType = :home
  else
    teamType = :away
  end
  game_hash()[teamType][:players].each do |playerName, playerAttributes|
    playerAttributes.each do |attribute, value|
      if attribute == :number
        jerseyNumbers.push(value)
      end
    end
  end
  return jerseyNumbers
end

def player_stats(playerName)
  playerStats = {}
  if game_hash()[:home][:players][playerName] != nil
    teamType = :home
  else
    teamType = :away
  end
  playerStats = game_hash()[teamType][:players][playerName]
  return playerStats
end

def big_shoe_rebounds
  arrayOfData = []
  shoeSizes = []
  shoeSizePlayerName = {}
  game_hash().each do |location, teamData|
    teamData.each do |dataType, data|
      if dataType == :players
        data.each do |playerName, playerAttributes|
            playerAttributes.each do |valueType, value|
              if valueType == :shoe
                shoeSizes.push(value)
                shoeSizePlayerName[value] = playerName
              end
            end
          end
        end
      end
    end
  shoeSizes = shoeSizes.sort()
  largestShoeSize = shoeSizes.last()
  if game_hash()[:home][:players][shoeSizePlayerName[largestShoeSize]][:rebounds] != nil
    return game_hash()[:home][:players][shoeSizePlayerName[largestShoeSize]][:rebounds]
  else
    return game_hash()[:away][:players][shoeSizePlayerName[largestShoeSize]][:rebounds]
  end
end
