class TeamsBelongsToGroup < ActiveRecord::Migration[7.0]
  def change
    change_table :teams do |t|
      t.references :group
    end
  end
end
