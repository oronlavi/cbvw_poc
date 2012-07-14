class NewsTemplate < ActiveRecord::Base
  attr_accessible :detail, :major, :minor, :news_type
end
