class Collection < ActiveRecord::Base

  has_many :collection_images, :dependent => :destroy
  has_many :products, :dependent => :destroy

  validates :name, presence: true
  validates :name, uniqueness: true

end
