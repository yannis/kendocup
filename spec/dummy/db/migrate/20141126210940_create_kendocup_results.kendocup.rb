# This migration comes from kendocup (originally 20141009093718)
class CreateKendocupResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.string :name
      t.string :category_type
      t.integer :category_id
      t.references :kenshi, index: true

      t.timestamps
    end
  end
end
