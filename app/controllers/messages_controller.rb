class MessagesController < ApplicationController
  

  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = @chatroom.messages.new(message_params)
    @message.sender = current_user
    @message.receiver = @chatroom.other_user(current_user)
    if @message.save
      
      redirect_to @chatroom
    else
      flash[:error] = "Error sending message"
      redirect_to @chatroom
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end