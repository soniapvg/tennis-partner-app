require 'rails_helper'


ActionMailer::Base.perform_deliveries = false

RSpec.describe User, type: :model do

  before(:each) do 
    @user =FactoryBot.create(:user) 
    @other_user=FactoryBot.create(:user) 
  end

  it "has a valid factory" do
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
        user2 = create(:user, date_of_birth: Date.new(1992, 7, 12))
        expect(user2.age).to eq(30)
      end
    end

    describe "#chatrooms" do
      it "should return an array or nil if empty" do
        expect(@user.chatrooms.to_a).to eq([])
      end

      it "should return an array or nil if empty" do
        chatroom_1 = FactoryBot.create(:chatroom, user1: @user)
        expect(@user.chatrooms.to_a).to be_an(Array)
      end

      it "should return the correct array of chatrooms" do
        chatroom_1 = FactoryBot.create(:chatroom, user1: @user)
        chatroom_2 = FactoryBot.create(:chatroom, user2: @user)
        chatroom_3 = FactoryBot.create(:chatroom)
        expect(@user.chatrooms.to_a).to match_array([chatroom_1, chatroom_2])
      end
    end

    describe "#has_chatroom_with?" do
      it "should return a boolean" do
        expect(@user.has_chatroom_with?(@other_user)).to be(true).or be(false)
      end
      it "should return true if they do false if they dont" do
        expect(@user.has_chatroom_with?(@other_user)).to eq(false)
      end
      it "should return true if they do false if they dont" do
        chatroom_1 = FactoryBot.create(:chatroom, user1: @user, user2: @other_user)
        expect(@user.has_chatroom_with?(@other_user)).to eq(true)
      end
    end

    describe "#common_chatroom_id_with" do

      it "should say if user has a chatroom" do
        chatroom_1 = FactoryBot.create(:chatroom, user1: @user, user2: @other_user)
        expect(@user.has_chatroom_with?(@other_user)).to be(true)
      end

      it "should return a chatroom" do
        chatroom_1 = FactoryBot.create(:chatroom, user1: @user, user2: @other_user)
        expect(@user.common_chatroom_id_with(@other_user)).to be_a(Chatroom)
      end


    end

    describe "#messages" do

      it "should return an array or nil if empty" do
        expect(@user.messages.to_a).to eq([])
      end

      it "should return an array or nil if empty" do
        chatroom_1 = FactoryBot.create(:chatroom, user1: @user, user2: @other_user)
        message_1 = FactoryBot.create(:message, receiver:@user, sender:@other_user)
        expect(@user.chatrooms.to_a).to be_a(Array)
      end
      it "should return the correct array of messages" do

        chatroom_1 = FactoryBot.create(:chatroom, user1: @user, user2: @other_user)
        message_1 = FactoryBot.create(:message, receiver:@user, sender:@other_user)
        expect(@user.chatrooms.to_a.length).to eq(1)
      end
    end

    describe '.search' do
      
      user1 =FactoryBot.create(:user, gender: 'Homme', experience: '15/1' )
      user2 =FactoryBot.create(:user, gender: 'Femme', experience: '15/2' )
      user3 =FactoryBot.create(:user, gender: 'Autre', experience: '15/3', week_night: false, weekend_night: false, week_day: false, weekend_day: false)
      user4 =FactoryBot.create(:user, gender: 'Homme', experience: '15', week_night: false, weekend_night: false, week_day: true, weekend_day: true)
      user5 =FactoryBot.create(:user, gender: 'Homme', experience: '-30' )
      user6 = FactoryBot.create(:user, gender: 'Femme', experience: '5/6', week_night: false, weekend_night: false, week_day: false, weekend_day: true, outside: true)

      context 'when searching for partners with no filters' do
        it 'returns all users with appropriate level' do
          expect(User.search({}, user1)).to include( user3, user4, user6)
          expect(User.search({}, user1)).not_to include(user2, user5, user1)
        end
      end
  
      context 'when searching for partners with gender filter' do
        it 'returns only partners with the selected gender or "Autre"' do
          expect(User.search({ gender: 'Femme' }, user1)).to include( user3, user6)
          expect(User.search({ gender: 'Femme' }, user1)).not_to include(user1, user2, user4, user5)
        end
      end

      context 'when searching for partners with availability filter' do
        it 'returns all partners with at least one the selected availabilities' do
          expect(User.search({ week_day: '1', wend_day: '1'}, user1)).to include(user4, user6)
          expect(User.search({ week_day: '1', wend_day: '1' }, user1)).not_to include(user2, user5, user1, user3)
        end
      end

      context 'when searching for partners with inside/outside filter' do
        it 'returns all partners with the "only outside" option set to false' do
          expect(User.search({ inside: '1'}, user1)).to include(user3, user4)
          expect(User.search({ inside: '1'}, user1)).not_to include(user2, user5, user1, user6)
        end
      end

      
    end
  end

end