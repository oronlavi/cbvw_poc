class RemoveNewsItemIdFromMatches < ActiveRecord::Migration
  def up
    remove_column :matches, :NewsItem_id
  end

  def down
    add_column :matches, :NewsItem_id, :integer
  end
end
