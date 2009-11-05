class Category < ActiveRecord::Base
  # Relationships
  has_many :projects, :counter_cache => true
  
  # Validations
  validates_uniqueness_of :name
  validates_presence_of :name
end
