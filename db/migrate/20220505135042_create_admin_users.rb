class CreateAdminUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :admiusers do |t|


      t.timestamps

    end
  end
end
