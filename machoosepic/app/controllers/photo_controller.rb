class PhotoController < ApplicationController
  def index
    @photo = Photo.first
  end

  def show
    @photo = nil
    begin
      @photo = Photo.find params['id']
    rescue
    end
  end

end
