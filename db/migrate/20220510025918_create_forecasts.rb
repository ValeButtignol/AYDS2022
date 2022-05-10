class CreateForecasts < ActiveRecord::Migration[7.0]
  def change
      create_table :forecasts do |t|
        t.integer :home_goals
        t.integer :visitor_goals
        t.string :winner
  
        t.references :player_user
        t.references :match
        
        t.timestamps
    end
  end
end