class AddPositionToProjectImageAndCategory < ActiveRecord::Migration
  def self.up
    add_column :projects, :position, :integer
    add_column :categories, :position, :integer
    add_column :assets, :position, :integer
  end

  def self.down
    remove_column :assets, :position
    remove_column :categories, :position
    remove_column :projects, :position
  end
end
