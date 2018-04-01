class PlayersController < ApplicationController
    include SessionsHelper
    def list
      if logged_in? && current_player.admin? # Only admin can view player list
        @players = Player.all
        render 'list'
      else
        redirect_to login_path
      end
    end

    def show
      @player = Player.find(params[:id])
    end

    def new
    	@player = Player.new
    end

    def edit
    	@player = Player.find(params[:id])
    end

    def create
      @player = Player.new(player_params)
      @player.score = 0
      @player.rank = 0

      @players = Player.all 
      @players = @players.sort_by { |obj| obj.score }
      @players = @players.reverse
      i = 1
      @players.each do |item|
        item.rank = i
        item.save
        i += 1
      end


  		if @player.save
			log_in @player
			remember @player



  			redirect_to @player
  		else
  			render 'new'
  		end

    end

    def update

      @player = Player.find(params[:id])

      if @player.update(player_params)
        redirect_to @player
      else
        render 'edit'
      end

    end

  private

    def player_params
      params.require(:player).permit(:last_name, :first_name, :password, :email, :username)
    end

end
