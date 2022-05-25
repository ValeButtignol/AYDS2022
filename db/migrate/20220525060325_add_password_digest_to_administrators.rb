class AddPasswordDigestToAdministrators < ActiveRecord::Migration[7.0]
  def change
    add_column :administrators, :password_digest, :string, default: '', null: false
  end
end
