class FixAwayGoalsName < ActiveRecord::Migration
  def change
    rename_column :matches, :awaygoals_id, :awaygoals
  end
end
