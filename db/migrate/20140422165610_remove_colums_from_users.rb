class RemoveColumsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :email, :encrypted_password, :reset_password_token
    remove_column :users, :reset_password_sent_at, :remember_created_at, :sign_in_count
    remove_column :users, :current_sign_in_at , :last_sign_in_at, :current_sign_in_ip
    remove_column :users, :last_sign_in_ip
  end
end