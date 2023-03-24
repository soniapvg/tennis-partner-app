class InvitationsController < ApplicationController
  layout 'user'
  
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @invitation = @chatroom.invitations.new(invitation_params)
    @invitation.sender = current_user
    @invitation.receiver = @chatroom.other_user(current_user)
    if @invitation.save
      redirect_to @chatroom
    else
      flash[:error] = "Error sending invitation"
      redirect_to @chatroom
    end
  end

  def index
    @invitations = current_user.invitations
  end

  private

  def invitation_params
    params.require(:invitation).permit(:content)
  end
end