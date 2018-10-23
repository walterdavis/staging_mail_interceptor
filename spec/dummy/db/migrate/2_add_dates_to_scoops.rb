class AddDatesToScoops < ActiveRecord::Migration[5.1]
  def change
    add_column :scoops, :date_scooped, :date
    add_column :scoops, :datetime_scooped, :datetime
  end
end
