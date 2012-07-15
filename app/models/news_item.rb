class NewsItem < ActiveRecord::Base
  attr_accessible :match_id, :news_template_id
  belongs_to :match
  belongs_to :news_template
end
