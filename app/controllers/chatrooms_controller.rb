class ChatroomsController < ApplicationController
  before_action :owner? , only: %i[ show edit update destroy ]
  def index
    @chatrooms = current_user.chatrooms
  end

  def create
    other_user = User.find(params[:user_id])
    @chatroom = Chatroom.new(user1: current_user, user2: other_user)
    if @chatroom.save
      redirect_to @chatroom
    else
      flash[:error] = "Error creating chatroom"
      redirect_to root_path
    end
  end

  def show   
    @chatroom = Chatroom.find(params[:id])
    @other_user = @chatroom.other_user(current_user)
    @message = Message.new
    @invitation = Invitation.new
    @posts = @chatroom.messages
    @posts += @chatroom.invitations
    @posts = (@chatroom.messages + @chatroom.invitations).sort_by(&:post_date)
    @send_message = params[:send_message] == "true"
  end


  private

  def owner?
    @chatroom = Chatroom.find(params[:id])
    redirect_to root_path unless @chatroom.part_of_chatroom(current_user)
  end
end