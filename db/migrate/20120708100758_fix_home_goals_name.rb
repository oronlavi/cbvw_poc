class FixHomeGoalsName < ActiveRecord::Migration
  def change
    rename_column :matches, :homegoals_id, :homegoals
  end
end
