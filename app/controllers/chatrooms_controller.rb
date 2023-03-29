class ChatroomsController < ApplicationController
  before_action :owner? , only: %i[ show edit update destroy ]
  layout 'user'

  def index
    # Get all the chatrooms for the current user
    @chatrooms = current_user.chatrooms.includes(:messages)
  
    # Filter out chatrooms with no messages
    @chatrooms = @chatrooms.select { |chatroom| chatroom.messages.present? }
  
    # Sort the chatrooms by their latest message's created_at time
    @chatrooms = @chatrooms.sort_by { |chatroom| chatroom.messages.last.created_at }.reverse!
  end

  def create
    other_user = User.find(params[:user_id])
    @chatroom = Chatroom.new(user1: current_user, user2: other_user)
    if @chatroom.save
      redirect_to @chatroom
    else
      flash[:error] = "Error creating chatroom"
      # redirect_to root_path
      redirect_to other_user
    end
  end

  def show   
    @chatroom = Chatroom.find(params[:id])
    @other_user = @chatroom.other_user(current_user)
    @message = Message.new
    
    @messages = @chatroom.messages
    
    @messages = @messages.sort_by(&:post_date)
    
  end

  private

  def owner?
    @chatroom = Chatroom.find(params[:id])
    redirect_to root_path unless @chatroom.part_of_chatroom(current_user)
  end
end
