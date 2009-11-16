class Category < ActiveRecord::Base
  # Plugins
  has_guid :name
  
  # Relationships
  has_many :projects
  
  # Validations
  validates_uniqueness_of :name
  validates_presence_of :name
  
  # Scopes
  default_scope :order => "categories.position ASC, categories.name ASC"
end
