class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar
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
  enum gender: { femme: 1, homme: 2, autre: 3 }

  def age
    (Date.today - date_of_birth).to_i / 365
  end
end
