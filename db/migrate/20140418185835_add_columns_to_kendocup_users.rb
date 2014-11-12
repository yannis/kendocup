class AddColumnsToKendocupUsers < ActiveRecord::Migration
  def change
    add_column :kendocup_users, :provider, :string
    add_column :kendocup_users, :uid, :string
  end
end
