class Project < ActiveRecord::Base
  # Plugins
  has_guid :name
  
  # Relationships
  belongs_to :category, :counter_cache => true
  has_many :assets, :dependent => :destroy
  
  # Validations
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_presence_of :category_id
  
  # Scopes
  default_scope :order => "projects.position ASC, projects.name ASC"
  named_scope :with_assets, :conditions => "assets.project_id=projects.id", :include => :assets
  
  # Returns first item and remaining array separately
  def self.first_with_remainder
    projects = self.with_assets
    unless projects.nil?
      first = projects.shift
      [first,projects]
    end
  end
  
  # Returns the first asset for the project if it exists.
  def first_asset
    assets.first unless assets.blank?
  end
  
  # Showcase image
  def showcase_image
    first_asset.image unless first_asset.nil?
  end
end
