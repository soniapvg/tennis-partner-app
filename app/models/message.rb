class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  after_create :notification_email
  def post_date
    created_at
  end

  def message #C'est quoi ça ?
    @receiver = User.find(self.receiver_id)
    @sender = User.find(self.sender_id)
    @content = self.content

  end # jamais called non plus depuis les controllers ?

  def notification_email
    @receiver = User.find(self.receiver_id)
    @sender = User.find(self.sender_id)
    @content = self.content
    UserMailer.notification_email(@receiver,@sender,@content).deliver_now!
  end
end
