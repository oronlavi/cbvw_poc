class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :teamname
      t.string :email
      t.string :country
      t.integer :age

      t.timestamps
    end
  end
end
