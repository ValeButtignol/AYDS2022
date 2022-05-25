class DeletePlayerPassword < ActiveRecord::Migration[7.0]
  def change
    change_table :players do |t|
      t.remove :password
    end
  end
end
