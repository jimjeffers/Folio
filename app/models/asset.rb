class Asset < ActiveRecord::Base
  # Plugins
  has_attached_file :image, :styles => { :screenshot => "940x1000", :preview => "940x400#", :showcase => "220x140#", :thumbnail => "100x75#" }
  has_guid :name
  
  # Relationships
  belongs_to :project
  
  # Validations
  validates_presence_of :alt_text
  
  # Scopes
  default_scope :order => "assets.position ASC, assets.name ASC"
end
