class AddTeamProfile < ActiveRecord::Migration[7.0]
  def change
    add_column :matches, :lost_match, :integer, default: 0
    add_column :matches, :won_match, :integer, default: 0
    add_column :matches, :drawn_match, :integer, default: 0
    add_column :matches, :GF, :integer, default: 0
    add_column :matches, :GC, :integer, default: 0
  end
end
