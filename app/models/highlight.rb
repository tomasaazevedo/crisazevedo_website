class Highlight < ActiveRecord::Base

  has_attached_file :image, styles: { thumb: "100x50", small: "200x100", med: "400x200", large: "800x400" }

  validates_attachment :image, presence: true

  validates_attachment_content_type :image, 
                                    :content_type => /^image\/(png|jpg|jpeg)/,
                                    :message => 'only (png/jpg/jpeg) images'

  validates_attachment :image, :size => { :in => 0..10.megabytes }

  validates :title, presence: true

end
