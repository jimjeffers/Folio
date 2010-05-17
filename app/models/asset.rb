class Asset < ActiveRecord::Base
  # Constants
  IMAGE_SSW = 940
  IMAGE_SSH = 1000
  IMAGE_PW = 940
  IMAGE_PH = 400
  IMAGE_SCW = 220
  IMAGE_SCH = 140
  IMAGE_TNW = 100
  IMAGE_TNH = 75
  
  # Plugins
  has_attached_file :image,
        :styles => { :screenshot => ["#{IMAGE_SSW}x#{IMAGE_SSH}>", :jpg],
                     :preview => ["#{IMAGE_PW}x#{IMAGE_PH}#", :jpg],
                     :showcase => ["#{IMAGE_SCW}x#{IMAGE_SCH}#", :jpg],
                     :thumbnail => ["#{IMAGE_TNW}x#{IMAGE_TNH}#", :jpg] },
        :processors => [:jcropper],
        :default_url => "/images/default_image.png"
  has_guid :name
  
  # Relationships
  belongs_to :project
  
  # Validations
  validates_presence_of :alt_text
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/pjpeg', 'image/jpg', 'image/png']
  
  # Scopes
  default_scope :order => "assets.position ASC, assets.name ASC"

  # Hooks
  after_update :reprocess_image, :if => :cropping?
  
  # Accessors
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  
  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end
    
  def image_geometry(style = :original)
    @geometry ||= {}
    @geometry[style] ||= Paperclip::Geometry.from_file image.path(style)
  end
  
  private
  
  def reprocess_image
    image.reprocess!
  end
end
