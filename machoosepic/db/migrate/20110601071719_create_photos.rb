class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.string :href, :null => false
      t.string :owner
      t.integer :elo_rating => {:default => 1000}
      t.integer :match_count => {:default => 0}

      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end
