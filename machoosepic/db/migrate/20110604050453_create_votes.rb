class CreateVotes < ActiveRecord::Migration
  def self.up
    create_table :votes do |t|
      t.string :address
      t.integer :photo_id_winner
      t.integer :photo_id_loser
      t.integer :winner_original_rating
      t.integer :loser_original_rating

      t.timestamps
    end
  end

  def self.down
    drop_table :votes
  end
end
