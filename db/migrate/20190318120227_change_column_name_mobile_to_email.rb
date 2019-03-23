class ChangeColumnNameMobileToEmail < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :mobile_number, :email
  end
end
