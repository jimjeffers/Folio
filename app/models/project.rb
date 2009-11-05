class Project < ActiveRecord::Base
  # Relationships
  belongs_to :category
  
  # Validations
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_presence_of :category_id
end
