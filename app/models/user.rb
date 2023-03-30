class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar

  after_create :welcome_send

  
  has_many :chatrooms_as_user1, class_name: 'Chatroom', foreign_key: 'user1_id', dependent: :destroy
  has_many :chatrooms_as_user2, class_name: 'Chatroom', foreign_key: 'user2_id', dependent: :destroy
  has_many :sent_messages, class_name: 'Message', foreign_key: 'sender_id', dependent: :destroy
  has_many :received_messages, class_name: 'Message', foreign_key: 'receiver_id', dependent: :destroy

  
  enum experience: { 
    'Débutant': 1, 
    '40': 2, 
    '30/5': 3, 
    '30/4': 4, 
    '30/3': 5, 
    '30/2': 6, 
    '30/1': 7, 
    '30': 8, 
    '15/5': 9, 
    '15/4': 10, 
    '15/3': 11, 
    '15/2': 12, 
    '15/1': 13, 
    '15': 14, 
    '5/6': 15, 
    '4/6': 16,
    '3/6': 17,
    '2/6': 18,
    '1/6': 19,
    '0': 20,
    '-2/6': 21,
    '-4/6': 22,
    '-15': 23,
    '-30': 24
  }
  enum gender: { Femme: 1, Homme: 2, Autre: 3 }

  def age
    if date_of_birth.present?
    (Date.today - date_of_birth).to_i / 365
    end
  end

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  def chatrooms
    chatrooms_as_user1.or(chatrooms_as_user2)
  end

  def self.search(partner_params, user)
    @partners = User.where.not(id: user.id)

    case partner_params[:gender]
    when "Femme"
      @partners = @partners.select{|partner| (partner.gender == "Femme")|| (partner.gender == "Autre" ) }
    when "Homme"
      @partners = @partners.select{|partner| (partner.gender == "Homme")|| (partner.gender == "Autre" ) }
    else
      @partners = @partners.select{|partner| (partner.gender == "Homme")|| (partner.gender == "Autre" ) || (partner.gender == "Femme" ) }
    end
    
    if partner_params[:week_day]== "1" || partner_params[:week_evening]== "1" || partner_params[:wend_day]== "1" || partner_params[:wend_evening]== "1"
      disponibilities = []
      disponibilities << :week_day if partner_params[:week_day]== "1"
      disponibilities << :week_night if partner_params[:week_evening]== "1"
      disponibilities << :weekend_day if partner_params[:wend_day]== "1" 
      disponibilities << :weekend_night if partner_params[:wend_evening]== "1"
      
      @partners = @partners.select do |partner|
        disponibilities.any? { |disponibility| partner[disponibility] }
      end

    end

    if partner_params[:inside] == "1"
      @partners = @partners.select{|partner| (partner.outside === false)}
    end

    @partners = User.filter_level(@partners,user)

    return @partners
  end


  def self.filter_level(partner,user)
    @partners = partner
    @partners = @partners.select do |partner|
      if user.gender == "Homme"
        if partner.gender == "Homme"
          partner.experience_before_type_cast >= (user.experience_before_type_cast - 3) && partner.experience_before_type_cast <= (user.experience_before_type_cast + 3)
        elsif partner.gender == "Femme" 
          partner.experience_before_type_cast >= user.experience_before_type_cast && partner.experience_before_type_cast <= (user.experience_before_type_cast + 4)
        else
          partner.experience_before_type_cast >= (user.experience_before_type_cast - 4) && partner.experience_before_type_cast <= (user.experience_before_type_cast + 4)
        end
      elsif user.gender == "Femme"
        if partner.gender == "Femme"
          partner.experience_before_type_cast >= (user.experience_before_type_cast - 3) && partner.experience_before_type_cast <= (user.experience_before_type_cast + 3)
        elsif partner.gender == "Homme" 
          partner.experience_before_type_cast >= (user.experience_before_type_cast - 4) && partner.experience_before_type_cast <= user.experience_before_type_cast
        else
          partner.experience_before_type_cast >= (user.experience_before_type_cast - 4) && partner.experience_before_type_cast <= (user.experience_before_type_cast + 4)
        end
      else
        partner.experience_before_type_cast >= (user.experience_before_type_cast - 4) && partner.experience_before_type_cast <= (user.experience_before_type_cast + 4)
      end
    end

    return @partners
  end

  
  def has_chatroom_with?(other_user)
    Chatroom.where(user1_id: [self.id, other_user.id], user2_id: [self.id, other_user.id]).exists?
  end

  def common_chatroom_id_with(other_user)
    Chatroom.where(user1: self, user2: other_user).or(Chatroom.where(user1: other_user, user2: self)).first
  end

  def messages
    sent_messages.or(received_messages)
  end

end

