class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :username
      t.string :email
      t.string :password
      t.integer :points
      
      t.timestamps
    end
  end
end
