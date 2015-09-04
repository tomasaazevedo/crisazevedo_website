class Collection < ActiveRecord::Base

  has_many :collection_images
  has_many :products

  validates :name, presence: true
  validates :name, uniqueness: true

end
