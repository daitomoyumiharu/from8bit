class GenresController < ApplicationController
  def index
    @genres = Genre.all
  end

  def show
    @genre = Genre.find(params[:id])
    @musics = Music.where(genre_id: @genre.id)
  end

end
