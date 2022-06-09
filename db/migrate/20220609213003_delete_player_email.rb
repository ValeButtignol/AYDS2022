class DeletePlayerEmail < ActiveRecord::Migration[7.0]
  def change
    change_table :players do |a|
      a.remove :email
    end
  end
end
