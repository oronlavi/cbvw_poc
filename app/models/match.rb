class Match < ActiveRecord::Base
  attr_accessible :NewsItem_id, :awaygoals_id, :awayteam, :awayuser_id, :datetime, :homegoals_id, :hometeam, :homeuser_id
end
