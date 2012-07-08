class Match < ActiveRecord::Base
  attr_accessible :NewsItem_id, :awaygoals, :awayteam, :awayuser_id, :datetime, :homegoals, :hometeam, :homeuser_id
  belongs_to :homeuser, :class_name => "User"
  belongs_to :awayuser, :class_name => "User"
end
