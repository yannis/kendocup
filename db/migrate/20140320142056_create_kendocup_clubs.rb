class CreateKendocupClubs < ActiveRecord::Migration
  def change
    create_table :kendocup_clubs do |t|
      t.string :name

      t.timestamps
    end
  end
end
