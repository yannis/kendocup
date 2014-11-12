class AddFeeFieldsToKendocupCups < ActiveRecord::Migration
  def change
    add_column :kendocup_cups, :junior_fees_chf, :integer
    add_column :kendocup_cups, :junior_fees_eur, :integer
    add_column :kendocup_cups, :adult_fees_chf, :integer
    add_column :kendocup_cups, :adult_fees_eur, :integer
  end
end
