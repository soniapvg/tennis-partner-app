class RemoveAgeAndAddNewFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :age, :integer
    add_column :users, :date_of_birth, :date
    add_column :users, :gender, :integer
    add_column :users, :experience, :integer
    add_column :users, :description, :text
    add_column :users, :week_day, :boolean, default: false
    add_column :users, :week_night, :boolean, default: false
    add_column :users, :weekend_day, :boolean, default: false
    add_column :users, :weekend_night, :boolean, default: false
  end
end
