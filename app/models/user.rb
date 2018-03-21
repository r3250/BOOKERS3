class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         authentication_keys: [:name]

  validates :name, length:{ in: 2..20}
  validates :name, presence: true

  validates :introduction, length:{maximum:50}


  has_many :books
  attachment :image
end
