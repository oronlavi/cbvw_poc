module ApplicationHelper

  #Returns the number of matches played by the user
  def matches_played(user)
    user.home_matches.count + user.away_matches.count
  end

  # Returns the number of games won by the user
  def matches_won(user)
    home_matches = user.home_matches
    away_matches = user.away_matches
    home_matches.select{ |match| match.homegoals_id > match.awaygoals_id }.count +
        away_matches.select{ |match| match.homegoals_id < match.awaygoals_id }.count
  end

  # Returns the number of games drawn by the user
  def matches_drawn(user)
    matches = user.home_matches + user.away_matches
    matches.select { |match| match.homegoals_id == match.awaygoals_id}.count
  end

  # Returns the number of games lost by the user
  def matches_lost(user)
    matches = user.home_matches + user.away_matches
    matches.count - (matches_won(user) + matches_drawn(user))
  end

  def goals_for(user)
    home_matches = user.home_matches
    away_matches = user.away_matches
    count = 0
    home_matches.each { |match| count += match.homegoals_id}
    away_matches.each { |match| count += match.awaygoals_id}
    count
  end

  def goals_against(user)
    home_matches = user.home_matches
    away_matches = user.away_matches
    count = 0
    home_matches.each { |match| count += match.awaygoals_id}
    away_matches.each { |match| count += match.homegoals_id}
    count
  end

  def pts(user)
    3 * matches_won(user) + matches_drawn(user)
  end

end