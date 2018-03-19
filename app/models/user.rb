class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         authentication_keys: [:name]
  validates :name, presence: true
  validates :name, length:{minimum:2, maximum:20}
  

  has_many :books
  attachment :image
end
