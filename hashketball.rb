require 'pry'
def game_hash()
  hash = {
  :home =>{
    :team_name => "Brooklyn Nets",
    :colors => ["Black","White"],
    :players =>[{ 
      :player_name => "Alan Anderson",
      :number => 0,
      :shoe => 16,
      :points => 22,
      :rebounds => 12,
      :assists =>12,
      :steals => 3,
      :blocks => 1,
      :slam_dunks =>1,
      
    },
    { 
      :player_name => "Reggie Evans",
      :number => 30,
      :shoe => 14,
      :points => 12,
      :rebounds => 12,
      :assists =>12,
      :steals => 12,
      :blocks => 12,
      :slam_dunks =>7,
      
    },
    { 
      :player_name => "Brook Lopez",
      :number => 11,
      :shoe => 17,
      :points => 17,
      :rebounds => 19,
      :assists =>10,
      :steals => 3,
      :blocks => 1,
      :slam_dunks =>15,
      
    },
    { 
      :player_name => "Mason Plumlee",
      :number => 1,
      :shoe => 19,
      :points => 26,
      :rebounds => 11,
      :assists =>6,
      :steals => 3,
      :blocks => 8,
      :slam_dunks =>5,
      
    },
    { 
      :player_name => "Jason Terry",
      :number => 31,
      :shoe => 15,
      :points => 19,
      :rebounds => 2,
      :assists =>2,
      :steals => 4,
      :blocks => 11,
      :slam_dunks =>1,
      
    }
    ]
    
  },
  :away =>{
    :team_name => "Charlotte Hornets",
    :colors => ["Turquoise", "Purple"],
    :players =>[{
      :player_name => "Jeff Adrien",
      :number => 4,
      :shoe => 18,
      :points => 10,
      :rebounds => 1,
      :assists => 1,
      :steals => 2,
      :blocks => 7,
      :slam_dunks =>2
      
    },
    { 
      :player_name => "Bismack Biyombo",
      :number => 0,
      :shoe => 16,
      :points => 12,
      :rebounds => 4,
      :assists =>7,
      :steals => 22,
      :blocks => 15,
      :slam_dunks =>10,
      
    },
    { 
      :player_name => "DeSagna Diop",
      :number => 2,
      :shoe => 14,
      :points => 24,
      :rebounds => 12,
      :assists =>12,
      :steals => 4,
      :blocks => 5,
      :slam_dunks =>5,
      
    },
    { 
      :player_name => "Ben Gordon",
      :number => 8,
      :shoe => 15,
      :points => 33,
      :rebounds => 3,
      :assists =>2,
      :steals => 1,
      :blocks => 1,
      :slam_dunks =>0,
      
    },
    { 
      :player_name => "Kemba Walker",
      :number => 33,
      :shoe => 15,
      :points => 6,
      :rebounds => 12,
      :assists =>12,
      :steals => 7,
      :blocks => 5,
      :slam_dunks =>12,
      
    }
    
    ]
  }
}
hash
 end
def num_points_scored(player_name)
  game_hash.each do |home_or_away, team|
  team.each do |team_attributes, data|
    if team_attributes == :players
      data.each do |player| 
      return player[:points] if player[:player_name] == player_name  end
    end
  end
end
end
def shoe_size(player_name)
  game_hash.each do |home_or_away, team|
    team.each do |team_attributes,data|
      if team_attributes == :players
        data.each do |player|
        return player[:shoe] if player[:player_name] == player_name end
      end
    end
  end
end
def team_colors(team_name)
  game_hash.each do |home_or_away,team|
   team.each do |team_attributes, data|
     if team[:team_name] == team_name
       return team[:colors] if team[:colors]
     end
   end
 end
 end
 def team_names
   teams = []
   game_hash.each do |home_or_away,team|
     team.each do |team_attributes,data|
       teams << data if team_attributes == :team_name
    end
  end
  teams
end
def player_numbers(team_name)
  team_player_numbers = []
  game_hash.each do |home_or_away, team|
    team.each do |team_attributes,data|
      if team[:team_name] == team_name
        if team_attributes == :players
        data.each do |player|
          team_player_numbers << player[:number]
        end
      end
    end
  end
end
team_player_numbers
end
def player_stats(player_name)
  stats_of_player = {}
  game_hash.each do |home_or_away,team|
    team.each do|team_attributes,data|
    if team_attributes == :players
      data.each do |player|
        if player[:player_name] ==player_name
          player.each do |attributes,data|
            stats_of_player[attributes] = data
            stats_of_player.delete(:player_name)
        end
      end
    end
  end
end
end
stats_of_player
end
def big_shoe_rebounds
  largest_size = 0 
  rebounds = 0
  game_hash.each do |home_or_away,team|
    team.each do |team_attributes,data|
      if team_attributes == :players
        data.each do |player|
          if player[:shoe] > largest_size
            largest_size = player[:shoe]
            rebounds = player[:rebounds]
          end
        end
      end
    end
  end
  rebounds
end
def most_points_scored
  highest_score_of_points = 0
  mvp = " "
  game_hash.each do |home_or_away,team|
    team.each do |team_attributes,data|
      if team_attributes == :players
        data.each do |player|
          if player[:points] > highest_score_of_points
            highest_score_of_points = player[:points]
            mvp = player[:player_name]
          end
        end
      end
    end
  end
  mvp
end
def winning_team
  home_score = 0 
  away_score = 0 
    game_hash.each do |home_or_away, team|
      team.each do |team_attributes, data|
      if team_attributes == :players
          data.each do |player|
           if home_or_away == :home
            home_score += player[:points]
          else
            away_score += player[:points]
          end
        end
      end
    end
  end
  if home_score > away_score
   return game_hash[:home][:team_name]
  else
   return game_hash[:away][:team_name]
  end
end
 def player_with_longest_name
   length_of_player_name = 0 
   result = " "
   game_hash.each do |home_or_away,team|
     team.each do |team_attributes, data|
       if team_attributes == :players
         data.each do |player|
           if player[:player_name].length > length_of_player_name
             length_of_player_name = player[:player_name].length
             result = player[:player_name]
           end
         end
       end
     end
   end
   result
 end
 #hi
def long_name_steals_a_ton?
  length_of_player_name = 0 
  highest_steals = 0
  result = 0
  player_with_most_steals = " "
  game_hash.each do |home_or_away,team|
    team.each do |team_attributes,data|
        if team_attributes == :players
          data.each do |player|
          if player[:steals] > highest_steals 
            highest_steals = player[:steals]
            player_with_most_steals = player[:player_name]
           if player[:player_name].length > length_of_player_name
              length_of_player_name = player[:player_name].length
              result = player[:player_name]
              return true if result == player_with_most_steals
             end
           end
         end
       end
     end
   end
   return false
 end
  

