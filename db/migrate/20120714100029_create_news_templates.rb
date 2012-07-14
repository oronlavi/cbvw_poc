class CreateNewsTemplates < ActiveRecord::Migration
  def change
    create_table :news_templates do |t|
      t.string :major
      t.string :minor
      t.text :detail
      t.integer :news_type

      t.timestamps
    end
  end
end
