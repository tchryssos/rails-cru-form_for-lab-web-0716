class SongsController < ApplicationController
  before_action only: [:edit, :show, :update] do
    set_song
  end

  def new
    @song=Song.new
  end

  def index
    @songs=Song.all
  end

  def create
    @song=Song.create(song_params)
    redirect_to song_path(@song)
  end

  def show
  end

  def edit
  end

  def update
    @song.update(song_params)
    redirect_to song_path(@song)
  end

  private

  def set_song
    @song=Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:name, :artist_id, :genre_id)
  end
end
