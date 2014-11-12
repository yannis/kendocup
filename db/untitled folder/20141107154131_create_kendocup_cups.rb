class CreateKendocupCups < ActiveRecord::Migration
  def change
    create_table :kendocup_cups do |t|
      t.date :start_on
      t.date :end_on
      t.datetime :deadline
      t.integer :junior_fees_chf
      t.integer :junior_fees_eur
      t.integer :adult_fees_chf
      t.integer :adult_fees_eur

      t.timestamps
    end
  end
end
