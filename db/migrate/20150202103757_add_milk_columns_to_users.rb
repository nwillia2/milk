class AddMilkColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :got_milk_date, :datetime
    add_column :users, :got_milk_quantity, :integer, :default => 1
  end
end
