class User < ActiveRecord::Base
  attr_accessible :age, :country, :email, :teamname, :username
  validates :email, :username, :teamname, :uniqueness => true, :length => {:maximum => 20}
  has_many :home_matches, :foreign_key =>  "homeuser_id", :class_name => "Match"
  has_many :away_matches, :foreign_key =>  "awayuser_id", :class_name => "Match"

end
