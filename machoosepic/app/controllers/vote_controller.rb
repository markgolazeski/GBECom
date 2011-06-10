class VoteController < ApplicationController
  def index
    #Get two random ids
    #random ID 1
    rand_offset_1, rand_offset_2 = 0, 0
    
    if Photo.count > 0
      while rand_offset_1 == rand_offset_2
        rand_offset_1, rand_offset_2 = rand(Photo.count), rand(Photo.count)
      end
      @photo1 = Photo.first(:offset => rand_offset_1)
      @photo2 = Photo.first(:offset => rand_offset_2)
    else
      @photo1 = Photo.new
      @photo2 = Photo.new
    end

  end

  def show
  end

  def create
    flash[:notice] = "Thanks for voting!"
    #flash[:params] = params

    photo1_id = params['photo_1']
    photo2_id = params['photo_2']

    winner = params['photo_id_vote']
    loser = nil

    if winner == photo1_id
      calculate_set_everything photo1_id, photo2_id
      loser = photo2_id
    else
      calculate_set_everything photo2_id, photo1_id
      loser = photo1_id
    end

    redirect_to :vote_index
  end

  def calculate_set_everything winning_photo_id, losing_photo_id
    winning_photo = Photo.find(winning_photo_id)
    losing_photo = Photo.find(losing_photo_id)

    Vote.create(:address => request.remote_ip, 
                :photo_id_winner => winning_photo_id,
                :photo_id_loser => losing_photo_id,
                :winner_original_rating => winning_photo.rating,
                :loser_original_rating => losing_photo.rating)

    winning_photo.increment(:match_count)
    losing_photo.increment(:match_count)

    winning_photo_new_rating = winning_photo.set_new_calculated_rating 1, losing_photo.rating
    losing_photo_new_rating = losing_photo.set_new_calculated_rating 0, winning_photo.rating

  end
end
