class AddSourceToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :source, :string
  end

  def self.down
    remove_column :posts, :source
  end
end
