require 'rails_helper'

RSpec.describe Chatroom, type: :model do
  let(:user1) { FactoryBot.create(:user) }
  let(:user2) { FactoryBot.create(:user) }
  let(:chatroom) { FactoryBot.create(:chatroom, user1: user1, user2: user2) }

  describe "validations" do
    it "is valid with valid attributes" do
      expect(chatroom).to be_valid
    end

    it "is invalid without user1" do
      chatroom.user1 = nil
      expect(chatroom).to be_invalid
    end

    it "is invalid without user2" do
      chatroom.user2 = nil
      expect(chatroom).to be_invalid
    end

    it "is invalid when user1 and user2 are the same" do
      chatroom.user2 = user1
      expect(chatroom).to be_invalid
    end

    it "is invalid when a chatroom already exists for the same pair of users" do
      FactoryBot.create(:chatroom, user1: user1, user2: user2)
      expect(chatroom).to be_invalid
    end

    it "is valid when a chatroom already exists for a different pair of users" do
      other_user1 = FactoryBot.create(:user)
      other_user2 = FactoryBot.create(:user)
      FactoryBot.create(:chatroom, user1: other_user1, user2: other_user2)
      expect(chatroom).to be_valid
    end
  end

  describe "associations" do
    it { should belong_to(:user1).class_name('User') }
    it { should belong_to(:user2).class_name('User') }
    it { should have_many(:messages).dependent(:destroy) }
  end

  describe "methods" do
    it "returns the correct list of users" do
      expect(chatroom.users).to eq([user1, user2])
    end

    it "returns the correct other user" do
      expect(chatroom.other_user(user1)).to eq(user2)
      expect(chatroom.other_user(user2)).to eq(user1)
    end

    it "returns true if user is part of the chatroom" do
      expect(chatroom.part_of_chatroom(user1)).to be_truthy
      expect(chatroom.part_of_chatroom(user2)).to be_truthy
    end

    it "returns false if user is not part of the chatroom" do
      other_user = FactoryBot.create(:user)
      expect(chatroom.part_of_chatroom(other_user)).to be_falsey
    end
  end
end
