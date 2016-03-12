class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  def index
    @songs = Song.includes([:album, :artist]).recent
    respond_with(@songs)
  end

  def show
    respond_with(@song)
  end

  def new
    @song = Song.new
    respond_with(@song)
  end

  def edit
  end

  def create
    @song = Song.new(song_params)
    @song.save
    respond_with(@song)
  end

  def update
    @song.update(song_params)
    respond_with(@song)
  end

  def destroy
    @song.destroy
    redirect_to songs_path
    #    respond_with(@song)
  end

  private
  def set_song
    if action_name=="show"
      @song = Song.includes([:album, :artist]).find(params[:id])
    else
      @song = Song.find(params[:id])
    end
  end

  def song_params
    params.require(:song).permit(:name, :album_id, :artist_id)
  end
end
