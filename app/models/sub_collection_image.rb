class SubCollectionImage < ActiveRecord::Base

  belongs_to :sub_collection

  has_attached_file :sub_collection_image, styles: { small: "64x64", med: "100x100", large: "200x200" }

  validates_attachment :sub_collection_image, presence: true

  validates_attachment_content_type :sub_collection_image, 
                                    :content_type => /^image\/(png|jpg|jpeg)/,
                                    :message => 'only (png/jpg/jpeg) images'

  validates_attachment :sub_collection_image, :size => { :in => 0..5.megabytes }

  validates :sub_collection, presence: true

end
