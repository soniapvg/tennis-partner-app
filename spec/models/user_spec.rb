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

    describe "#first_name" do
      it { expect(@user).to validate_presence_of(:first_name) }
    end

    describe "#last_name" do
      it { expect(@user).to validate_presence_of(:last_name) }
    end


  end

  context "associations" do

    describe "books" do
      it { expect(@user).to have_many(:books) }
    end

    describe "messages" do
      it { expect(@user).to have_many(:received_messages) }
    end
  end

  context "public instance methods" do

    

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