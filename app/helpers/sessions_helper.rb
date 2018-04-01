module SessionsHelper

  # Logs in the given user:
  def log_in(player)
    session[:player_id] = player.id
    @players = Player.all 
    @players = @players.sort_by { |obj| obj.score }
    @players = @players.reverse
    i = 1
    @players.each do |item|
      item.rank = i
      item.save
      i += 1
    end
  end

  # Remembers a user in a persistent session:
  def remember(player)
    player.remember
    cookies.permanent[:player_id] = player.id
    cookies.permanent[:remember_token] = player.remember_token
  end

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

  # Delete player's login database and cookie records:
  def forget(player)
    return if player.nil?
    player.forget
    cookies.delete(:player_id)
    cookies.delete(:remember_token)
  end

  # Clears logged-in user's session:
  def log_out
    forget(current_player)
    session.delete(:player_id)
    @player = nil
  end

  # Returns logged in player if the provided id is a match:
  def authorized_player(id)
    player = Player.find(id)
    if logged_in? && player == current_player
      return player
    end
  end

end
