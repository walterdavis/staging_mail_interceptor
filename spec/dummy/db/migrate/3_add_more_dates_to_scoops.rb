class AddMoreDatesToScoops < ActiveRecord::Migration[5.1]
  def change
    add_column :scoops, :date_eaten, :date
    add_column :scoops, :datetime_eaten, :datetime
    add_column :scoops, :date_frozen, :date
    add_column :scoops, :datetime_frozen, :datetime
  end
end
