require 'rails_helper'

RSpec.describe Message, type: :model do
  describe "associations" do
    it { should belong_to(:chatroom) }
    it { should belong_to(:sender).class_name('User') }
    it { should belong_to(:receiver).class_name('User') }
  end

  describe "validations" do
    let(:message) { FactoryBot.build(:message) }

    it "is valid with content, sender, receiver, and chatroom" do
      expect(message).to be_valid
    end

    it "is invalid without content" do
      message.content = nil
      expect(message).to be_invalid
    end

    it "is invalid without a sender" do
      message.sender = nil
      expect(message).to be_invalid
    end

    it "is invalid without a receiver" do
      message.receiver = nil
      expect(message).to be_invalid
    end

    it "is invalid without a chatroom" do
      message.chatroom = nil
      expect(message).to be_invalid
    end
  end

  describe "#post_date" do
    let(:message) { FactoryBot.create(:message) }

    it "returns the created_at date" do
      expect(message.post_date).to eq(message.created_at)
    end
  end

  describe "#notification_email" do
    let(:message) { FactoryBot.create(:message) }

    it "sends an email notification" do
      expect { message.notification_email }.to change { ActionMailer::Base.deliveries.count }.by(1)
    end
  end
end
