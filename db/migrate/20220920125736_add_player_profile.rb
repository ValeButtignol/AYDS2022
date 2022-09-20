class AddPlayerProfile < ActiveRecord::Migration[7.0]
  def change
    add_column :players, :forecasts_hit, :integer, default: 0
    add_column :players, :forecasts_miss, :integer, default: 0
    add_column :players, :forecasts_half_hit, :integer, default: 0
    add_column :players, :forecasts_made, :integer, default: 0
  end
end
