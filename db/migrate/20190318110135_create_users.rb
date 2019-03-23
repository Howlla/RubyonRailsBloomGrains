class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :mobile_number, null: false, index: true, unique: true
      t.string :name
      t.string :password_digest, null: false
      t.datetime :last_login
      t.timestamps
    end
  end
end
