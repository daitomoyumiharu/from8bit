class MusicsController < ApplicationController
  def index
    
  end

  def new
    @music = Music.new
  end
end
