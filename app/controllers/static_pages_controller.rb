class StaticPagesController < ApplicationController

  include SessionsHelper

  def help
  end

  def about
  end

  def home
    @player = current_player
    if @player
      redirect_to ('/gamepage/'+ @player.id.to_s)
    end
  end
end
