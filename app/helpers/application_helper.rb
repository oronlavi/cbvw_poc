module ApplicationHelper

  #Returns the number of matches played by the user
  def matches_played(user)
    user.home_matches.find_all_by_ended(true).count + user.away_matches.find_all_by_ended(true).count
  end

  # Returns the number of games won by the user
  def matches_won(user)
    home_matches = user.home_matches.find_all_by_ended(true)
    away_matches = user.away_matches.find_all_by_ended(true)
    home_matches.select { |match| match.homegoals > match.awaygoals }.count +
        away_matches.select { |match| match.homegoals < match.awaygoals }.count
  end

  # Returns the number of games drawn by the user
  def matches_drawn(user)
    matches = user.home_matches.find_all_by_ended(true) + user.away_matches.find_all_by_ended(true)
    matches.select { |match| match.homegoals == match.awaygoals }.count
  end

  # Returns the number of games lost by the user
  def matches_lost(user)
    matches = user.home_matches.find_all_by_ended(true) + user.away_matches.find_all_by_ended(true)
    matches.count - (matches_won(user) + matches_drawn(user))
  end

  def goals_for(user)
    home_matches = user.home_matches.find_all_by_ended(true)
    away_matches = user.away_matches.find_all_by_ended(true)
    count = 0
    home_matches.each { |match| count += match.homegoals }
    away_matches.each { |match| count += match.awaygoals }
    count
  end

  def goals_against(user)
    home_matches = user.home_matches.find_all_by_ended(true)
    away_matches = user.away_matches.find_all_by_ended(true)
    count = 0
    home_matches.each { |match| count += match.awaygoals }
    away_matches.each { |match| count += match.homegoals }
    count
  end

  def pts(user)
    3 * matches_won(user) + matches_drawn(user)
  end

  def set_article_vars(str_in, match)
    string = str_in.dup
    string.gsub!('%hu', match.homeuser.username)
    string.gsub!('%au', match.awayuser.username)
    string.gsub!('%ht', match.hometeam)
    string.gsub!('%at', match.awayteam)
    string.gsub!('%hg', match.homegoals.to_s)
    string.gsub!('%ag', match.awaygoals.to_s)
    "<%= link_to 'hello','http://www.google.com' %>" + string
    string
  end

end