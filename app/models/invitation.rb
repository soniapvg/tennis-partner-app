class Invitation < ApplicationRecord
  belongs_to :chatroom
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  after_create :invitation

  def post_date
    created_at
  end

  def invitation
    @receiver = User.find(self.receiver_id)
    @sender = User.find(self.sender_id)
    @content = self.content
    UserMailer.invitation(@receiver,@sender,@content).deliver_now!
  end

end
