class SubCollection < ActiveRecord::Base

  has_many :sub_collection_images
  has_many :products

  belongs_to :collection

  validates :name, presence: true
  validates :name, uniqueness: true

  validates :collection, presence: true

end
