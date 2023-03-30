require 'rails_helper'

RSpec.describe Message, type: :model do

  before(:each) do 
    ActionMailer::Base.perform_deliveries = false

    @user =FactoryBot.create(:user) 
    @other_user=FactoryBot.create(:user)
    @chatroom = FactoryBot.create(:chatroom, user1: @user, user2:@other_user)
    @message = FactoryBot.create(:message, sender: @user, receiver: @other_user, chatroom: @chatroom)

  end

  it "has a valid factory" do
    expect(build(:message)).to be_valid
  end
  
  context "associations" do

    describe "chatrooms" do
      it { should belong_to(:sender).class_name('User') }
      it { should belong_to(:receiver).class_name('User') }
      it { should belong_to(:chatroom) }
    end

  end


  describe "#create" do
    let(:sender) { @user }
    let(:receiver) { @other_user }
    let(:content) { "Salut, tu veux jouer une partie de tennis ?" }

    context "when creating a message" do
      it "sends a notification email to the receiver" do
        expect { 
          Message.create(sender: sender, receiver: receiver, content: content)
        }.to change { ActionMailer::Base.deliveries.count }.by(1)

        expect(ActionMailer::Base.deliveries.last.to).to eq([receiver.email])
        expect(ActionMailer::Base.deliveries.last.subject).to include(sender.first_name)
      end
    end
  end

end