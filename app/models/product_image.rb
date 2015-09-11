class ProductImage < ActiveRecord::Base

  belongs_to :product

  has_attached_file :product_image, styles: { small: "100x100", med: "500x500", large: "1000x1000" }

  validates_attachment :product_image, presence: true

  validates_attachment_content_type :product_image, 
                                    :content_type => /^image\/(png|jpg|jpeg)/,
                                    :message => 'only (png/jpg/jpeg) images'

  validates_attachment :product_image, :size => { :in => 0..5.megabytes }

  validates :product, presence: true

  after_validation :clean_paperclip_errors

  def clean_paperclip_errors
    errors.delete(:product_image)
  end

end
