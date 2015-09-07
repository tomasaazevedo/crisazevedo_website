class CollectionImage < ActiveRecord::Base

  belongs_to :collection

  has_attached_file :collection_image, styles: { small: "100x100", med: "500x500", large: "1000x1000" }

  validates_attachment :collection_image, presence: true

  validates_attachment_content_type :collection_image, 
                                    :content_type => /^image\/(png|jpg|jpeg)/,
                                    :message => 'only (png/jpg/jpeg) images'

  validates_attachment :collection_image, :size => { :in => 0..5.megabytes }

  validates :collection, presence: true

end
