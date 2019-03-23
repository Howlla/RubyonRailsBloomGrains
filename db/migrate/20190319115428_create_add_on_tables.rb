class CreateAddOnTables < ActiveRecord::Migration[5.1]
  def change
    create_table :add_on_tables do |t|
      t.string :name
      t.float :rate
      t.text :info

      t.timestamps
    end
  end
end
