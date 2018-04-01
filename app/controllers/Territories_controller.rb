class TerritoriesController < ApplicationController

	include SessionsHelper


		# def leaderboard
		# 		@players = Player.all
		# 		@players = @players.sort_by { |obj| obj.score }
		# 		@players = @players.reverse
		# 		i = 1
		# 		@players.each do |item|
		# 				item.rank = i
		# 				item.save
		# 				i += 1
		# 		end
		# end

		def create
			@player = authorized_player(params[:id])
			if !@player.nil?
				@territory = @player.territory.create(coords:params[:coords], time:params[:time], area: params[:area], player_id:params[:id],
					center_lat: params[:center_lat], center_lng: params[:center_lng],username: @player.username)
				@player.score = @player.score + params[:area].to_f
				@player.save


				render json: {count: Territory.count}
				ActionCable.server.broadcast 'capture_channel',

																			{
																				territory: @territory,
																				owner: @player.username
																			}
				  @players = Player.all
    			@players = @players.sort_by { |obj| obj.score }
    			@players = @players.reverse
    			i = 1
    			@players.each do |item|
      				item.rank = i
      				item.save
      				i += 1
    			end
					@players.save

			else
				# throw error on incorrect user.
			end
		end

		def territories_in_view
			@player = authorized_player(params[:id])
			score = @player.score

			@bounds_lat_right = params[:lat_right]
			@bounds_lng_right = params[:lng_right]
			@bounds_lng_left = params[:lat_left]
			@bounds_lat_left = params[:lng_left]

			@territories = Territory.where('center_lat >'+@bounds_lat_left+' and center_lat <'+@bounds_lat_right+
			' and center_lng <'+@bounds_lat_right+' and center_lng >'+@bounds_lat_left)

			render json: {territories: @territories, score:score}
		end
		def invade
			@territory = Territory.find_by(id: params[:id])
			@player = authorized_player(@territory.player_id)
			@player.score = @player.score.to_f - @territory.area.to_f
			@player.save
			@player = authorized_player(params[:player_id])
			@player.score = @player.score.to_f + params[:area].to_f
			@territory.destroy
			@player.save

			Territory.create(coords: params[:coords], time: params[:time], area: params[:area],player_id: params[:player_id],
			center_lat: params[:center_lat], center_lng: params[:center_lng])

			render json: {
				player_id: params[:player_id],
	    	coords: params[:coords],
	    	time: params[:time],
	    	area: params[:area],
	    	name: @player.username,
	    	center_lat: params[:center_lat],
	    	center_lng: params[:center_lng],
			}
		end
		def expand
			@territory = Territory.find_by(id: params[:id])
			@territory.coords = params[:coords]
			@territory.time = params[:time]
			@territory.center_lat = params[:center_lat]
			@territory.center_lng = params[:center_lng]
			@territory.area = params[:area]
			@territory.save

			@player = authorized_player(params[:player_id])
			@player.score = @player.score.to_f - @territory.area.to_f
			@player.score = @player.score.to_f + params[:area].to_f
			@player.save
		end
end
