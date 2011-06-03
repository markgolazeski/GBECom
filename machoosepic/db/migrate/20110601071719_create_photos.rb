class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.integer :id
      t.string :href
      t.string :owner
      t.integer :rating => {:default => 1400}

      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end
