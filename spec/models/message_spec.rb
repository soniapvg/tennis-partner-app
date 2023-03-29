require 'rails_helper'

RSpec.describe Message, type: :model do

  before(:each) do 
    @user =FactoryBot.create(:user) 
    @other_user=FactoryBot.create(:user)
    @chatroom = FactoryBot.create(:chatroom, user1: @user, user2:@other_user)
    @message = FactoryBot.create(:message, sender: @user, receiver: @other_user, chatroom: @chatroom)

  end

  it "has a valid factory" do
    # teste toujours tes factories pour voir si elles sont valides
    expect(build(:message)).to be_valid
  end
  
  context "associations" do

    describe "chatrooms" do
      it { should belong_to(:sender).class_name('User') }
      it { should belong_to(:receiver).class_name('User') }
      it { should belong_to(:chatroom) }
    end

  end

  context "validation" do

    describe 'validations' do
      it 'is valid with content, sender, receiver, and chatroom' do
        expect(message).to be_valid
      end
  
      it 'is invalid without content' do
        message.content = nil
        expect(message).to be_invalid
      end
  
      it 'is invalid without sender' do
        message.sender = nil
        expect(message).to be_invalid
      end
  
      it 'is invalid without receiver' do
        message.receiver = nil
        expect(message).to be_invalid
      end
  
      it 'is invalid without chatroom' do
        message.chatroom = nil
        expect(message).to be_invalid
      end

    end

  end

end