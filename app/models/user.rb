class User < ActiveRecord::Base
  attr_accessible :age, :country, :email, :teamname, :username, :fifa_username

  validates :email, :username, :fifa_username, :teamname, :uniqueness =>
      {:unique => true, :case_sensitive => false}, :length => {:maximum => 20}

  has_many :home_matches, :foreign_key => "homeuser_id", :class_name => "Match"
  has_many :away_matches, :foreign_key => "awayuser_id", :class_name => "Match"


  before_save { self.email.downcase! }
  before_save { self.fifa_username.downcase! }

end
