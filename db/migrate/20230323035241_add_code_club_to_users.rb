class AddCodeClubToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :code_club, :string
  end
end
