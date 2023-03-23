class CreateChatrooms < ActiveRecord::Migration[7.0]
  def change
    create_table :chatrooms do |t|
      t.references :user1, foreign_key: { to_table: :users }, null: false
      t.references :user2, foreign_key: { to_table: :users }, null: false
      t.timestamps
    end

    add_index :chatrooms, [:user1_id, :user2_id], unique: true
  end
end
