require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  # Is the user logged in? Returns true if they are
  def is_logged_in?
    !session[:player_id].nil?
  end

  # Logging in as a player
  def log_in_as(player)
    session[:player_id] = player.id
  end
end
