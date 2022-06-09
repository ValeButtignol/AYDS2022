class DeleteAdminEmail < ActiveRecord::Migration[7.0]
  def change
    change_table :administrators do |a|
      a.remove :email
    end
  end
end
