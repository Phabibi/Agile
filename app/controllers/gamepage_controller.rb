class GamepageController < ApplicationController

  include SessionsHelper

  def show
    @player = authorized_player(params[:id])
    if @player
      render 'show'
    else
      redirect_to login_path
    end
  end
end
