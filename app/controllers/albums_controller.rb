class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  def index
    @albums = Album.includes(:publisher).all
    respond_with(@albums)
  end

  def show
    respond_with(@album)
  end

  def new
    @album = Album.new
    respond_with(@album)
  end

  def edit
  end

  def create
    @album = Album.new(album_params)
    @album.save
    respond_with(@album)
  end

  def update
    @album.update(album_params)
    respond_with(@album)
  end

  def destroy
    @album.destroy
    if request.xhr?
      render :text=>"success"
    else
      respond_with(@album)
    end
  end

  private
  def set_album
    #    @album = Album.joins([:publisher]).joins("left outer join songs on albums.id=songs.album_id").find(params[:id])
    if action_name=="show"
      @album = Album.includes(:publisher, :songs).find(params[:id])
    else
      @album = Album.find(params[:id])
    end
  end

  def album_params
    params.require(:album).permit(:name, :cover_art, :publisher_id, :released_on)
  end
end
