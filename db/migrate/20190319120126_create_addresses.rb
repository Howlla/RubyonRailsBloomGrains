class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :line1
      t.string :line2
      t.string :pin_code
      t.integer :user_id

      t.timestamps
    end
  end
end
