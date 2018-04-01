class SessionsController < ApplicationController

  include SessionsHelper

  def new
  end

  def create
    @player = Player.find_by(email: params[:session][:email])

    # Log in user only if passwords match; this will be modified later to use a secure verification.
    if @player && (params[:session][:password] == @player.password)
      log_in @player
      remember @player
      redirect_to @player
    else
      @login_error = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
