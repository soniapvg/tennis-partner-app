require 'rails_helper'


ActionMailer::Base.perform_deliveries = false

RSpec.describe Chatroom, type: :model do

  before(:each) do 
    @user =FactoryBot.create(:user) 
    @other_user=FactoryBot.create(:user)
    @chatroom = FactoryBot.create(:chatroom, user1: @user, user2:@other_user)
    
  end

  it "has a valid factory" do
    expect(build(:chatroom)).to be_valid
  end
  
  context "associations" do

    describe "chatrooms" do
      it { should belong_to(:user1).class_name('User') }
      it { should belong_to(:user2).class_name('User') }
      it { should have_many(:messages) }
    end

  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@chatroom).to be_a(Chatroom)
    end

  end

  describe '#users_cannot_create_chatroom' do

    context 'when user1 and user2 are the same' do
      let(:chatroom) { FactoryBot.build(:chatroom, user1: @user, user2: @user) }

      it 'returns an error message' do
        expect(chatroom).not_to be_valid
      end
    end

    context 'when a chatroom already exists for the same pair of users' do
      let(:chatroom) { FactoryBot.build(:chatroom, user1: @user, user2: @other_user) }

      it 'returns an error message' do
        expect(chatroom).not_to be_valid
      end
    end

  end

  describe '#part_of_chatroom' do
    it 'returns true for users in the chatroom' do
      expect(@chatroom.part_of_chatroom(@user)).to be true
      expect(@chatroom.part_of_chatroom(@other_user)).to be true
    end

    it 'returns false for users not in the chatroom' do
      @external_user = FactoryBot.create(:user)
      expect(@chatroom.part_of_chatroom(@external_user)).to be false
    end
  end

  describe '#other_user' do
    it 'returns the other user in the chatroom' do
      expect(@chatroom.other_user(@user)).to eq(@other_user)
      expect(@chatroom.other_user(@other_user)).to eq(@user)
    end
  end

  describe '#users' do
    it 'returns an array of the two users in the chatroom' do
      expect(@chatroom.users.to_a).to match_array([@user, @other_user])
    end
  end
end