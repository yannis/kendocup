class AddRemarksToKenshis < ActiveRecord::Migration
  def change
    add_column :kenshis, :remarks, :text
  end
end
