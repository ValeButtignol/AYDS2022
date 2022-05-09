class CreatePlayerUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|

      t.references :username, index: true, foreign_key: { to_table: :users }
      t.references :email, index: true, foreign_key: { to_table: :users }
      t.references :password, index: true, foreign_key: { to_table: :users }

      t.integer :points


      t.timestamps

    end
  end
end
