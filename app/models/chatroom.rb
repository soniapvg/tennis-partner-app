class Chatroom < ApplicationRecord
  belongs_to :user1, class_name: 'User'
  belongs_to :user2, class_name: 'User'
  has_many :messages, dependent: :destroy
  has_many :invitations, dependent: :destroy
  validate :users_cannot_create_chatroom
  validates :user1_id, uniqueness: { scope: :user2_id }

  def users_cannot_create_chatroom
    errors.add(:user2_id, 'cannot create chatroom with yourself') if user1_id == user2_id
    if Chatroom.exists?(user1_id: user1_id, user2_id: user2_id) || Chatroom.exists?(user1_id: user2_id, user2_id: user1_id)
      errors.add(:user2_id, 'chatroom already exists for this pair of users')
    end 
  end
  
  def users
    [user1, user2]
  end

  def other_user(user)
  self.users.reject { |u| u.id == user.id }.first
  end
  
  def part_of_chatroom(user)
    users.include?(user)
  end
end
