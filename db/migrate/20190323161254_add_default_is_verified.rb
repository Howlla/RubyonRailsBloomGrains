class AddDefaultIsVerified < ActiveRecord::Migration[5.1]
    def change
      change_column :users, :is_verified, :bool, default:false
    end
end
