class ChatroomsController < ApplicationController
  before_action :owner? , only: %i[ show edit update destroy ]

  def index
    @chatrooms = current_user.chatrooms.includes(:messages)
    @chatrooms = @chatrooms.select { |chatroom| chatroom.messages.present? }
    @chatrooms = @chatrooms.sort_by { |chatroom| chatroom.messages.last.created_at }.reverse!

    render layout: 'layouts/user_default'
  end

  def create
    other_user = User.find(params[:user_id])
    @chatroom = Chatroom.new(user1: current_user, user2: other_user)
    if @chatroom.save
      redirect_to @chatroom
    else
      flash[:warning] = "Une erreur est survenue lors de la création de la conversation"
      redirect_to other_user
    end
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @other_user = @chatroom.other_user(current_user)
    @message = Message.new
    @messages = @chatroom.messages
    @messages = @messages.sort_by(&:post_date).reverse

    render layout: 'layouts/user_chatroom'
  end

  private

  def owner?
    @chatroom = Chatroom.find(params[:id])
    redirect_to root_path unless @chatroom.part_of_chatroom(current_user)
  end
end
