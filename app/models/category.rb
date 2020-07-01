class Category < ApplicationRecord
  has_many :landscape_categories
  has_many :landscapes, through: :landscape_categories
end
