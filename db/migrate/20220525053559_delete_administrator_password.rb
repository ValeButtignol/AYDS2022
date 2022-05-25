class DeleteAdministratorPassword < ActiveRecord::Migration[7.0]
  def change
    change_table :administrators do |t|
      t.remove :password
    end
  end
end
