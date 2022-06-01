class AddMatchesType < ActiveRecord::Migration[7.0]
  def change
    add_column :matches, :match_type, :string
  end
end
