class CreateCancerwords < ActiveRecord::Migration
  def self.up
    create_table :cancerwords do |t|
      t.string :name
      t.integer :count

      t.timestamps
    end
  end

  def self.down
    drop_table :cancerwords
  end
end
