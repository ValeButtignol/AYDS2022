class CreateResults < ActiveRecord::Migration[7.0]
  def change
    create_table :results do |t|  
      t.integer :home_goals
      t.integer :visitor_goals
      t.string :winner
      
      t.references :match
      t.references :administrator
      
      t.timestamps
    end
  end
end
