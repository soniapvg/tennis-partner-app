class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  
  def post_date
    created_at
  end

  def message
    @receiver = User.find(self.receiver_id)
    @sender = User.find(self.sender_id)
    @content = self.content
  end

end
