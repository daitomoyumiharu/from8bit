class YearsController < ApplicationController
  def index
    @years = Year.all.reject { |year| year.id == 1 }
  end

  def show
    @year = Year.find(params[:id])
    @musics = @year.musics
  end
end
