class AddEndedMinutesToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :minutes, :integer
    add_column :matches, :ended, :boolean
  end
end
