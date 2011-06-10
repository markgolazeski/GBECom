class TopsController < ApplicationController
  def show
    @ranked_photos = Photo.order('elo_rating DESC').limit(50)
    @num_photos = Photo.count
    @num_votes = Vote.count
  end
end
