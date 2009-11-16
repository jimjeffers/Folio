class Asset < ActiveRecord::Base
  # Plugins
  has_attached_file :image, :styles => { :screenshot => "940x1000", :showcase => "940x300#", :thumb => "220x140#" }
  
  # Relationships
  belongs_to :project
  
  # Validations
  validates_presence_of :alt_text
end
