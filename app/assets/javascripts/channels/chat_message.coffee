$(document).on 'keypress', '[data-behavior~=speak_chat_messages]', (event) ->
  if event.KeyCode is 13 # return = send
    App.chat_message.speak event.target.value
    event.target.value = ''
    event.preventDefault()

App.chat_message = App.cable.subscriptions.create "ChatMessageChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel

  speak: (message) ->
    @perform 'speak', message: message
