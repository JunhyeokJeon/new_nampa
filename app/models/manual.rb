class Manual < ApplicationRecord
  belongs_to :user
  has_many :comments

  has_many :impressions, :as=>:impressionable

  acts_as_votable

  has_attached_file :image, styles: { medium: "980x980>", thumb: "300x300>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  
	def impression_count
	    impressions.size
	end
	
	def unique_impression_count
	    # impressions.group(:ip_address).size give => {'127.0.0.1' =>9, '0.0.0.0'=>1}
	    # so gettin keys from the hash and calculating the number of keys
	    impressions.group(:ip_address).size.keys.length #TESTED
	end
	
end
