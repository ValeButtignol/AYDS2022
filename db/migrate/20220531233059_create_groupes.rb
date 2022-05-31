class CreateGroupes < ActiveRecord::Migration[7.0]
  def change
    create_table :groupes do |t|
      t.string :name
      
      t.references :administrator
      
      t.timestamps
    end
  end
end
