class Project < ActiveRecord::Base
  # Relationships
  belongs_to :category, :counter_cache => true
  has_many :assets, :dependent => :destroy
  
  # Validations
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_presence_of :category_id
  
  # Scopes
  default_scope :order => "position ASC, name ASC"
end
