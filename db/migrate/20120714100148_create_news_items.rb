class CreateNewsItems < ActiveRecord::Migration
  def change
    create_table :news_items do |t|
      t.integer :news_template_id
      t.integer :match_id

      t.timestamps
    end
  end
end
