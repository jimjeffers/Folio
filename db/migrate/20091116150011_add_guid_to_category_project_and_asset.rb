class AddGuidToCategoryProjectAndAsset < ActiveRecord::Migration
  def self.up
    add_column :categories, :guid, :string
    add_column :projects, :guid, :string
    add_column :assets, :guid, :string
  end

  def self.down
    remove_column :assets, :guid
    remove_column :projects, :guid
    remove_column :categories, :guid
  end
end
