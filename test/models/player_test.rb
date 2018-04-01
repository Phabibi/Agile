require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  def setup
    @player = Player.new(first_name: "Example", last_name: "Player",
			 email: "example@example.com", password: "example",
			 password_confirmation: "example")
  end

  test "authenticate should return false for a player with nil digest" do
    assert_not @player.authenticate('')
  end
end
