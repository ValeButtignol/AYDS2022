class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.string :stadium
      t.datetime :date
      
      t.references :local_team, index: true, foreign_key: { to_table: :teams }
      t.references :visitor_team, index: true, foreign_key: { to_table: :teams }

      t.timestamps
    end
  end
end