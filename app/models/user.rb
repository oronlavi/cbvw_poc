class User < ActiveRecord::Base
  attr_accessible :country, :email, :name, :originName
end
