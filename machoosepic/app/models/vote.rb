class Vote < ActiveRecord::Base
  attr_accessible :id, :address, :photo_id_winner, :photo_id_loser, :winner_original_rating, :loser_original_rating
end
