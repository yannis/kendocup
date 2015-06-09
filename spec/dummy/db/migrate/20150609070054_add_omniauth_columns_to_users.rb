class AddOmniauthColumnsToUsers < ActiveRecord::Migration
  def change
    # omiauthable
    add_column :users, :provider, :string
    add_column :users, :uid, :string
  end
end
