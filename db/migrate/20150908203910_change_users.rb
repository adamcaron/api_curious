class ChangeUsers < ActiveRecord::Migration
  def change
    remove_column :users, :info
    remove_column :users, :credentials
    add_column :users, :provider, :string
    add_column :users, :token, :string
  end
end
