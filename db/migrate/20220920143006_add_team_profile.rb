class AddTeamProfile < ActiveRecord::Migration[7.0]
  def change
    add_column :teams, :lost_match, :integer, default: 0
    add_column :teams, :won_match, :integer, default: 0
    add_column :teams, :drawn_match, :integer, default: 0
    add_column :teams, :GF, :integer, default: 0
    add_column :teams, :GC, :integer, default: 0
  end
end
