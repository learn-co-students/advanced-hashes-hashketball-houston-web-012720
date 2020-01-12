def game_hash()
  game_data = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => 
        [{:player_name => "Alan Anderson",
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1},
        {:player_name => "Reggie Evans",
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7},
        {:player_name => "Brook Lopez",
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15},
        {:player_name => "Mason Plumlee",
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 11,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5},
        {:player_name => "Jason Terry",
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1}
        ]},
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => 
        [{:player_name => "Jeff Adrien",
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2
        },
        {:player_name => "Bismack Biyombo",
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 22,
        :blocks => 15,
        :slam_dunks => 10
        },
        {:player_name => "DeSagna Diop",
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5
        },
        {:player_name => "Ben Gordon",
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0
        },
        {:player_name => "Kemba Walker",
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 7,
        :blocks => 5,
        :slam_dunks => 12
        }
      ]
    }
  }
end

def num_points_scored(player)
  game_data = game_hash()
  points = nil
  game_data.each do |team, team_info|
    team_info[:players].each do |i|
      if i[:player_name] == player
        points = i[:points]
      end
    end
  end
  points
end

def shoe_size(player)
  game_data = game_hash()
  size = nil
  game_data.each do |team, team_info|
    team_info[:players].each do |i|
      if i[:player_name] == player
        size = i[:shoe]
      end
    end
  end
  size
end

def team_colors(target_team)
  game_data = game_hash()
  colors = nil
  game_data.each do |team, team_info|
    if team_info[:team_name] == target_team
      colors = team_info[:colors]
    end
  end
  colors
end

def team_names()
  game_data = game_hash()
  names = []
  game_data.each do |team, team_info|
    names << team_info[:team_name]
  end
  names
end

def player_numbers(team_name)
  game_data = game_hash
  jersey_nums = []
  game_data.each do |team, team_info|
    if team_info[:team_name] == team_name
      team_info[:players].each do |i|
        jersey_nums << i[:number]
      end  
    end  
  end
  jersey_nums
end

def player_stats (player)
  game_data = game_hash()
  stats = nil
  game_data.each do |team, team_info|
    team_info[:players].each do |i|
      if i[:player_name] == player
        stats = i
      end
    end
  end
  stats.delete (:player_name)
  stats
end

def big_shoe_rebounds()
  game_data = game_hash()
  big_foot = nil
  big_foot_rebounds = 
  big_foot_size = 0
  game_data.each do |team, team_info|
    team_info[:players].each do |i|
      if i[:shoe] > big_foot_size
        big_foot_size = i[:shoe]
        big_foot = i[:player_name]
        big_foot_rebounds = i[:rebounds]
      end
    end
  end
  big_foot_rebounds
end

def most_points_scored()
  game_data = game_hash()
  player = nil
  most_points = 0
  game_hash.each do |team, team_info|
    team_info[:players].each do |i|
      if i[:points] > most_points
        player = i[:player_name]
        most_points = i[:points]
      end
    end  
  end
  player
end

def winning_team()
  game_data = game_hash()
  winning_team = nil
  home_points = 0
  away_points = 0
  game_data[:home][:players].each do |i|
    home_points += i[:points]
  end
  game_data[:away][:players].each do |i|
    away_points += i[:points]
  end  
  if home_points > away_points
    winning_team = game_data[:home][:team_name]
  elsif away_points > home_points
    winning_team = game_data[:home][:team_name]
  else 
    winning_team = "its a tie"
  end  
  winning_team
end

def player_with_longest_name()
  game_data = game_hash()
  longest_name = nil
  length = 0
  game_data.each do |team, team_info|
    team_info[:players].each do |i|
      if i[:player_name].length > length
        longest_name = i[:player_name]
        length = longest_name.length
      end
    end
  end
  longest_name
end

def long_name_steals_a_ton?()
  game_data = game_hash()
  longest_name = player_with_longest_name()
  steals_the_most = nil
  steals = 0 
  game_data.each do |team, team_info|
    team_info[:players].each do |i|
      if i[:steals] > steals
        steals_the_most = i[:player_name]
        steals = i[:steals]
      end
    end
  end
  steals_the_most == longest_name
end








