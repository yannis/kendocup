class AddTimestampsToKendocupTeams < ActiveRecord::Migration
  def change
    change_table :kendocup_teams do |t|
      t.timestamps
    end
  end
end
