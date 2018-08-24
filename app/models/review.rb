class Review < ApplicationRecord
  belongs_to :product
  belongs_to :user

  validates :review, presence: true
end
