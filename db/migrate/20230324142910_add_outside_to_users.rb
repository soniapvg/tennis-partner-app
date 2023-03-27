class AddOutsideToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :outside, :boolean, default: false
  end
end
