class Product < ActiveRecord::Base

  has_many :product_images, :dependent => :destroy

  belongs_to :collection
  belongs_to :sub_collection

  validates :collection, presence: true
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :product_type, presence: true

  validates_associated :product_images

  accepts_nested_attributes_for :product_images, :allow_destroy => true 

  TYPELIST = [
    PRATO = 'prato',
    VASO = 'vaso',
    XICARA = 'xícara',
  ]

  after_validation :clean_product_images_errors

  def clean_product_images_errors
    errors.delete(:product_images)
  end

end
