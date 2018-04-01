module Admin
  class PlayersController < Admin::ApplicationController

    include SessionsHelper
    # To customize the behavior of this controller,
    # you can overwrite any of the RESTful actions. For example:
    #
    def index
      if logged_in? && current_player.admin?
        super
        @resources = Player.
          page(params[:page]).
          per(10)
      else
        redirect_to login_path
      end
    end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   Player.find_by!(slug: param)
    # end

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information
  end
end
