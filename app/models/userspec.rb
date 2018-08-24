class Userspec < ApplicationRecord
	belongs_to :user
	validates :skincolor, presence: true, numericality: true
end
