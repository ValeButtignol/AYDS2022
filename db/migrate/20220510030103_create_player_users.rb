class CreatePlayerUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :player_users do |t|
      t.integer :points
      
      t.timestamps
    end
  end
end