class VoteController < ApplicationController
  def index

  end

  def show
  end

  def create
    flash[:notice] = "Thanks for voting!"
    flash[:params] = params
    logger.info params
    redirect_to :vote_index
  end

  def calculate_set_photo_ratings winning_photo_id, losing_photo_id
    puts photo_id_1
    puts photo_id_2
    # New Rating for Photo 1 
    winning_photo = Photo.find(winning_photo_id)
    losing_photo = Photo.find(losing_photo_id)

    winning_photo_new_rating = winning_photo.rating + winning_photo.get_k * ( 1 - ( 1 / 1 + 10 ** ((winning_photo.rating - losing_photo.rating) / 400)))
    losing_photo_new_rating = losing_photo.rating + losing_photo.get_k * ( 0 - ( 1 / 1 + 10 ** ((losing_photo.rating - winning_photo.rating) / 400)))

    winning_photo.rating = winning_photo_new_rating
    losing_photo.rating = losing_photo_new_rating

    winning_photo.save!
    losing_photo.save!
  end
end
