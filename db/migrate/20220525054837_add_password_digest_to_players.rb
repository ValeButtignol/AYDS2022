class AddPasswordDigestToPlayers < ActiveRecord::Migration[7.0]
  def change
    add_column :players, :password_digest, :string, default: '', null: false
  end
end
