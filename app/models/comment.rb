class Comment < ApplicationRecord
  acts_as_paranoid

  # Relations
  belongs_to :user
  belongs_to :landscape
end
