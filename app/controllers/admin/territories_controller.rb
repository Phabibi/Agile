module Admin
  class TerritoriesController < Admin::ApplicationController
    # To customize the behavior of this controller,
    # you can overwrite any of the RESTful actions. For example:
    #


# Returns the current logged-in user (if any):
  def current_player
    if(player_id = session[:player_id])
        return Player.find_by(id: player_id)
    elsif (player_id = cookies[:player_id])
        player = Player.find_by(id: player_id)
        if player && player.authenticate(cookies[:remember_token])
            log_in player
              return player
        end
    end
  end

  # Returns true if the user is logged-in, false otherwise:
  def logged_in?
    !current_player.nil?
  end

   def index
    if logged_in? &&  current_player.admin?   #if the current user is the adming show the admin page
      super
      @resources = Territory.
        page(params[:page]).
        per(10)
      else
        redirect_to login_path                #else redirect to login
      end
    end




    
    # def index
    #   super
    #   @resources = Territory.
    #     page(params[:page]).
    #     per(10)
    # end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   Territory.find_by!(slug: param)
    # end

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information
  end
end
