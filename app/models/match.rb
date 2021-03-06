class Match < ActiveRecord::Base
  attr_accessible :awaygoals, :awayteam, :awayuser_id, :datetime,
                  :homegoals, :hometeam, :homeuser_id, :minutes, :ended
  attr_accessor :home_fifa_username, :away_fifa_username #virtual attr just for POST

  belongs_to :homeuser, :class_name => "User"
  belongs_to :awayuser, :class_name => "User"

  has_one :news_item, :dependent => :destroy

  validates :homeuser, :awayuser, :presence => {:present => true, :message => "must be an existing user"}
  validate :check_home_and_away_users

  def check_home_and_away_users
    errors.add(:awayuser_id, "can't be the same as Homeuser") if homeuser_id == awayuser_id
  end
end
