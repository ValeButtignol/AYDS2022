class AddTeamsIcons < ActiveRecord::Migration[7.0]
  def change
    add_column :teams, :icon, :string
  end
end
