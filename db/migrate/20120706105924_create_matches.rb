class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :homeuser_id
      t.integer :awayuser_id
      t.integer :homegoals_id
      t.integer :awaygoals_id
      t.string :hometeam
      t.string :awayteam
      t.datetime :datetime
      t.integer :NewsItem_id

      t.timestamps
    end
  end
end
