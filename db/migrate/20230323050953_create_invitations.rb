class CreateInvitations < ActiveRecord::Migration[7.0]
  def change
    create_table :invitations do |t|
      t.text :content
      t.belongs_to :chatroom, index: true
      t.belongs_to :sender, class_name: 'User', index: true
      t.belongs_to :receiver, class_name: 'User', index: true
      t.timestamps
    end
  end
end
