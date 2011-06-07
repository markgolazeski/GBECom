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

    winning_photo = Photo.find(winning_photo_id)
    losing_photo = Photo.find(losing_photo_id)

    winning_photo_new_rating = winning_photo.set_new_calculated_rating 1, losing_photo.rating
    losing_photo_new_rating = losing_photo.set_new_calculated_rating 0, winning_photo.rating
  end
end
