class Product < ActiveRecord::Base

  has_many :product_images, :dependent => :destroy

  belongs_to :collection
  belongs_to :sub_collection

  validates :collection, presence: true
  validates :name, presence: true
  validates :name, uniqueness: true

  accepts_nested_attributes_for :product_images, :allow_destroy => true 

  TYPELIST = [
    PRATO = 'Prato',
    VASO = 'Vaso',
    XICARA = 'Xícara',
  ]

end
