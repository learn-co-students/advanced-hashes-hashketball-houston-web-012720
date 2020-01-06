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

def num_points_scored(players_name)
   game_hash.each do |team_place,team_name|
     team_name.each do |team_attributes,team_data|
       if team_attributes == :players
       team_data.each do |player|
             if players_name == player[:player_name]
              return player[:points]
            end
        end
     end
   end
 end
end
def shoe_size(players_name)
  game_hash.each do |team_place,team_name|
    team_name.each do |team_attributes, team_data|
      if team_attributes == :players
        team_data.each do |player|
          if players_name == player[:player_name]
            return player[:shoe]
          end
        end
      end
    end
  end
end
def team_colors(team)
  
  game_hash.each do |team_place, team_name|
     team_name.each do |team_attributes, team_data| 
        if team == team_name[:team_name]
          return team_name[:colors]
      end
   end
end
end

def team_names
  teams = []
  game_hash.each do |team_place, team_name|
    if team_name[:team_name]    
      teams << team_name[:team_name]
    end
  end
  return teams
end
def player_numbers(team) 
  player_num = []
  game_hash.each do |team_place,team_name|
    if team_name[:team_name] == team
    team_name.each do|team_attributes, team_data|
    if team_attributes == :players
         team_data.each do |player|
            player.map do |key,value|
             if key == :number
                player_num <<  player[key]
            end
         end
     end
    end
  end
  end
end
return player_num
end
def player_stats(player_name)
  stats_hash = {}
    game_hash.each do |team_place,team_name|
      team_name.each do |team_attributes,team_data|
        if team_attributes == :players
          team_data.each do |players|
           if players[:player_name] == player_name
               players.map do |stats,value|
                 stats_hash[stats] = value
                 stats_hash.delete_if{|key,value| key == :player_name}
           end
         end
       end
     end
   end
 end
 stats_hash
 end
 
def big_shoe_rebounds
  largest_shoe_size = 0 
  rebounds = 0
  game_hash.each do|team_place, team_name|
    team_name.each do|team_attributes,team_data|
      if team_attributes == :players
        team_data.each do |players|
          if players[:shoe] > largest_shoe_size
                 largest_shoe_size = players[:shoe]
                 rebounds = players[:rebounds]
          end
      end
    end  
  end
end
 rebounds
end
def most_points_scored
  player = " "
  most_points_scored= 0 
  game_hash.each do|team_place, team_name|
    team_name.each do|team_attributes,team_data|
      if team_attributes == :players
        team_data.each do |players|
          if players[:points] > most_points_scored
               most_points_scored = players[:points]
              player = players[:player_name]
          end
      end
    end  
  end
end
player
end
def winning_team
  
 home_team_scored = 0 
 away_team_scored = 0
  game_hash.each do|team_place, team_name|
    team_name.each do|team_attributes,team_data|
      if team_attributes == :players
        team_data.each do |players|
          if team_place == :home
               home_team_scored += players[:points]
             else if team_place == :away 
               away_team_scored += players[:points]
               end
           end 
          end
      end
    end  
  end
      if home_team_scored > away_team_scored
        game_hash[:home][:team_name]
      else 
         game_hash[:away][:team_name]
       end
end

def player_with_longest_name
  result = " "
  length_of_player_name = 0
  game_hash.each do |team_place, team_name|
     team_name.each do |team_attributes,team_data|
        if team_attributes == :players
          team_data.each do |players|
            if players[:player_name].length > length_of_player_name
              length_of_player_name = players[:player_name].length
              result = players[:player_name]
            end
        end
      end
    end
  end
   
  result
end
