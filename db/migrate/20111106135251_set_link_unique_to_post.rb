class SetLinkUniqueToPost < ActiveRecord::Migration
  def self.up
    add_index :posts, :link, :unique => true
  end

  def self.down
    remove_index :posts, :column => :link
  end
end
