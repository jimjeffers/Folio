class AddCreditsToProject < ActiveRecord::Migration
  def self.up
    add_column :projects, :credits, :string
  end

  def self.down
    remove_column :projects, :credits
  end
end
