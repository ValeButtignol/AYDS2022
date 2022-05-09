class CreateMatchResults < ActiveRecord::Migration[7.0]
  def change
    create_table :matchresults do |t|


      t.timestamps

    end
  end
end
