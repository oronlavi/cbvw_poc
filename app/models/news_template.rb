class NewsTemplate < ActiveRecord::Base
  attr_accessible :detail, :major, :minor, :news_type
  has_many :news_items

  module NewsTypes
    HomeSmallWin = 1
    HomeBigWin = 2
    AwaySmallWin = 3
    AwayBigWin = 4
  end
end
