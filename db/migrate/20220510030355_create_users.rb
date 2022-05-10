class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username, index: { unique: true, name: 'unique_usernames' }
      t.string :email, index: { unique: true, name: 'unique_emails' }
      t.string :password

      t.timestamps
    end
  end
end