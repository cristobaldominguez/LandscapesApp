class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :landscapes, dependent: :destroy
  has_many :comments
  has_many :likes

  has_one_attached :profile
  has_one_attached :cover

  # Scopes

  # Class Methods

  # Instance Methods
  def full_name
    "#{name} #{lastname}"
  end
end
