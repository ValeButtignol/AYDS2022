class AddTeamsWonMatchesOfGroup < ActiveRecord::Migration[7.0]
  def change
    add_column :teams, :won_matches_of_group, :integer, default: 0
  end
end
