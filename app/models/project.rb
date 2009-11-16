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
  default_scope :order => "position ASC, name ASC"
  
  # Returns first item and remaining array separately
  def self.first_with_remainder
    projects = self.all
    unless projects.nil?
      first = projects.pop
      [first,projects]
    end
  end
end
