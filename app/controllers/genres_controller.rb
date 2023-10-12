class GenresController < ApplicationController
  def index
    @genres = Genre.all.reject { |genre| genre.id == 1 && 16 }
    @musics = Music.all
  end

  def show
    @genre = Genre.find(params[:id])
    @musics = @genre.musics
  end

end
