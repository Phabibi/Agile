#App.capture = App.cable.subscriptions.create "CaptureChannel",
  #connected: ->
    # Called when the subscription is ready for use on the server

  #disconnected: ->
    # Called when the subscription has been terminated by the server

  #received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    #$ ->
      #if $('#id-container')['0'].innerHTML != data.territory.player_id then $('#debug').text(data.territory.area)
