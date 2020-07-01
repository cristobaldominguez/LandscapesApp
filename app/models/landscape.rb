class Landscape < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes
  has_and_belongs_to_many :tags
  has_many :landscape_categories
  has_many :categories, through: :landscape_categories

  has_one_attached :image
end
