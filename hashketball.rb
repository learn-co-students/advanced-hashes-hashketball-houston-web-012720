def game_hash
  game_info = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {player_name: "Alan Anderson",
        number:0,
        shoe:16,
        points:22,
        rebounds:12,
        assists:12,
        steals:3,
        blocks:1,
        slam_dunks:1},
        {player_name: "Reggie Evans",
        number:30,
        shoe:14,
        points:12,
        rebounds:12,
        assists:12,
        steals:12,
        blocks:12,
        slam_dunks:7},
        {player_name: "Brook Lopez",
        number:11,
        shoe:17,
        points:17,
        rebounds:19,
        assists:10,
        steals:3,
        blocks:1,
        slam_dunks:15},
        {player_name: "Mason Plumlee",
        number:1,
        shoe:19,
        points:26,
        rebounds:11,
        assists:6,
        steals:3,
        blocks:8,
        slam_dunks:5},
        {player_name: "Jason Terry",
        number:31,
        shoe:15,
        points:19,
        rebounds:2,
        assists:2,
        steals:4,
        blocks:11,
        slam_dunks:1}
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {player_name: "Jeff Adrien",
        number:4,
        shoe:18,
        points:10,
        rebounds:1,
        assists:1,
        steals:2,
        blocks:7,
        slam_dunks:2},
        {player_name: "Bismack Biyombo",
        number:0,
        shoe:16,
        points:12,
        rebounds:4,
        assists:7,
        steals:22,
        blocks:15,
        slam_dunks:10},
        {player_name: "DeSagna Diop",
        number:2,
        shoe:14,
        points:24,
        rebounds:12,
        assists:12,
        steals:4,
        blocks:5,
        slam_dunks:5},
        {player_name: "Ben Gordon",
        number:8,
        shoe:15,
        points:33,
        rebounds:3,
        assists:2,
        steals:1,
        blocks:1,
        slam_dunks:0},
        {player_name: "Kemba Walker",
        number:33,
        shoe:15,
        points:6,
        rebounds:12,
        assists:12,
        steals:7,
        blocks:5,
        slam_dunks:12}
      ]
    }
  }
  game_info
end

def team_players(team)
  pp game_hash[team][:players]
end

# team_players(:away)

def num_points_scored(player_name)
  game_hash.each_key do |key|
    game_hash[key][:players].each do |i|
      if i[:player_name] == (player_name)
        return i[:points]
      end
    end
  end
end
# num_points_scored("Alan Anderson")

def shoe_size(player_name)
  game_hash.each_key do |key|
    game_hash[key][:players].each do |i|
      if i[:player_name] == (player_name)
        return i[:shoe]
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each_key do |key|
    if game_hash[key][:team_name] == team_name
      return game_hash[key][:colors]
    end
  end
end

def team_names()
  teams = []
  game_hash.each_key {|keys| teams.push(game_hash[keys][:team_name])}
  teams
end

def player_numbers(team_name)
  player_set_numbers = []
  game_hash.each_key do |key|
    if game_hash[key][:team_name] == team_name
      game_hash[key][:players].each do |i|
        player_set_numbers.push( i[:number])
      end
    end
  end
  player_set_numbers
end

# player_numbers("Brooklyn Nets")

def player_stats(player_name)
  stats = {}
  game_hash.each_key do |key|
    game_hash[key][:players].each do |i|
      if i[:player_name] == player_name
        i.each{|k, l| stats[k] = l}
        stats.delete(:player_name)
      end
    end
  end
  stats
end

def big_shoe_rebounds()
  big_shoe_man = {new_shoe: 0, new_rebound: 0}
  game_hash.each_key do |key|
    game_hash[key][:players].each do |i|
      if i[:shoe] > big_shoe_man[:new_shoe]
        big_shoe_man[:new_shoe] = i[:shoe]
        big_shoe_man[:new_rebound] = i[:rebounds]
      end
    end
  end
  big_shoe_man[:new_rebound]
end

# big_shoe_rebounds

def most_points_scored()
  superstar = {new_name: "", new_points: 0}
  game_hash.each_key do |key|
    game_hash[key][:players].each do |i|
      if i[:points] > superstar[:new_points]
        superstar[:new_name] = i[:player_name]
        superstar[:new_points] = i[:points]
      end
    end
  end
  superstar[:new_name]
end

def winning_team()
  scores_by_name = {}
  high_score_team = {high_name: "The Goose Eggs", high_score: 0}
  game_hash.each do |key, value|
    scores_by_name[value[:team_name]] = 0
    game_hash[key][:players].each do |i|
      scores_by_name[value[:team_name]] += i[:points]
    end
  end
  scores_by_name.each do |key, value|
    if value > high_score_team[:high_score]
      high_score_team[:high_name] = key
      high_score_team[:high_score] = value
    end
  end
  high_score_team[:high_name]
end

def player_with_longest_name()
  namus_longus = " "
  game_hash.each do |key, value|
    value[:players].each do |i|
      i[:player_name].length > namus_longus.length ? namus_longus = i[:player_name] : nil
    end
  end
  namus_longus
end
# player_with_longest_name

def long_name_steals_a_ton?()
  ln_stats = player_stats(player_with_longest_name)
  ln_stats[:player_name] = player_with_longest_name
  is_longest_sneakiest = nil
  game_hash.each do |key, value|
    value[:players].each do |i|
      if i[:steals] < ln_stats[:steals] || i[:player_name] == ln_stats[:player_name]
      else
        return false
      end
    end
  end
  true
  # pp stats_of_longname
end

# long_name_steals_a_ton?
