class User < ActiveRecord::Base
  attr_accessible :age, :country, :email, :teamname, :username
end
