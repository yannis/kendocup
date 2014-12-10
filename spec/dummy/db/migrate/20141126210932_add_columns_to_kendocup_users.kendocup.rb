# This migration comes from kendocup (originally 20140418185835)
class AddColumnsToKendocupUsers < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
  end
end
