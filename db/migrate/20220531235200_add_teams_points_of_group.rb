class AddTeamsPointsOfGroup < ActiveRecord::Migration[7.0]
  def change
    add_column :teams, :points_of_group, :integer, default: 0
  end
end
