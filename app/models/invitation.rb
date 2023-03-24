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
    @sender = current_user
    @content = self.content
    if UserMailer.invitation(@receiver,@sender,@content).deliver_now!
      flash[:notice] = "L'invitation a bien été envoyée."
    else
      flash[:alert] = "Une erreur est survenue lors de l'envoi de l'invitation."
    end
  end

end
