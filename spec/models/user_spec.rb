require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do 
    @user =FactoryBot.create(:user) 
    @other_user=FactoryBot.create(:user) 
  end

  it "has a valid factory" do
    # teste toujours tes factories pour voir si elles sont valides
    expect(build(:user)).to be_valid
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@user).to be_a(User)
    end

    describe "#email" do
      it { expect(@user).to validate_presence_of(:email) }
    end


  end

  context "associations" do

    describe "chatrooms" do
      it { expect(@user).to have_many(:chatrooms_as_user1) }
    end

    describe "chatrooms" do
      it { expect(@user).to have_many(:chatrooms_as_user2) }
    end

    describe "messages" do
      it { expect(@user).to have_many(:sent_messages) }
    end

    describe "messages" do
      it { expect(@user).to have_many(:received_messages) }
    end
  end

  context "public instance methods" do

    describe "#age" do

      it "should return a int" do
        expect(@user.age).to be_a(Integer)
      end

      it "should return the correct age" do
        user =FactoryBot.create(:user, date_of_birth: Date.new(1994, 7, 12) )
        expect(user.age).to eq(28)
        user_2 = create(:user, date_of_birth: Date.new(1992, 7, 12))
        expect(user_2.age).to eq(30)
      end
    end

    describe "#chatrooms" do

      it "should return an array or nil if empty" do
        expect(@user.chatrooms).to eq([])
      end

      it "should return an array or nil if empty" do
        chatroom_1 = FactoryBot.create(:chatroom, user_1: @user)
        expect(@user.chatrooms).to be_an(Array)
      end

      it "should return the correct array of chatrooms" do
        chatroom_1 = FactoryBot.create(:chatroom, user_1: @user)
        chatroom_2 = FactoryBot.create(:chatroom, user_2: @user)
        chatroom_3 = FactoryBot.create(:chatroom)
        expect(@user.chatrooms.length).to match_array([chatroom_1, chatroom_2])
      end
    end

    describe "#has_chatroom_with?" do

      it "should return a boolean" do
        expect(@user.has_chatroom_with?(@other_user)).to be_a(Boolean)
      end

      it "should return true if they do false if they dont" do
        
        expect(@user.has_chatroom_with?(@other_user)).to eq(false)
      end
      it "should return true if they do false if they dont" do
        chatroom_1 = FactoryBot.create(:chatroom, user_1: @user, user_2: @other_user)
        expect(@user.has_chatroom_with?(@other_user)).to eq(true)
      end
    end

    describe "#common_chatroom_id_with" do

      it "should return a chatroom" do
        chatroom_1 = FactoryBot.create(:chatroom, user_1: @user, user_2: @other_user)
        expect(@user.has_chatroom_with?(@other_user)).to be_a(Chatroom)
      end

      
    end

    describe "#messages" do

      it "should return an array or nil if empty" do
        expect(@user.messages).to be_a(nil)
      end

      it "should return an array or nil if empty" do
        chatroom_1 = FactoryBot.create(:chatroom, user_1: @user, user_2: @other_user)
        message_1 = FactoryBot.create(:message, user_1:@user, user2:@other_user)
        expect(@user.chatrooms).to be_a(Array)
      end
      it "should return the correct array of messages" do
        
        chatroom_1 = FactoryBot.create(:chatroom, user_1: @user, user_2: @other_user)
        message_1 = FactoryBot.create(:message, user_1:@user, user2:@other_user)
        expect(@user.chatrooms.length).to eq(1)
      end
    end
  end

end