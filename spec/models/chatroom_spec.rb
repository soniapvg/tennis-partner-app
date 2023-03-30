require 'rails_helper'

RSpec.describe Chatroom, type: :model do

  before(:each) do 
    @user =FactoryBot.create(:user) 
    @other_user=FactoryBot.create(:user)
    @chatroom = FactoryBot.create(:chatroom, user1: @user, user2:@other_user)
  end

  it "has a valid factory" do
    # teste toujours tes factories pour voir si elles sont valides
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

    describe "presence of 2 users is respected" do
      it { expect(@chatroom).to validate_presence_of(:user1) }
      it { expect(@chatroom).to validate_presence_of(:user2) }
    end

    it 'is invalid without user1' do
      chatroom.user1 = nil
      expect(chatroom).to be_invalid
    end

    it 'is invalid without user2' do
      chatroom.user2 = nil
      expect(chatroom).to be_invalid
    end

  end


end