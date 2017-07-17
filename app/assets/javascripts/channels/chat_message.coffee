App.chat_message = App.cable.subscriptions.create "ChatMessageChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#chat_messages').append '<div>' + data['user_name'] + ': ' + data['message'] + '</div>'
    ret = data["message"].match(/^\/img (.*)/)
    if ret?
      $.get 'http://localhost:3001/images/' + ret[1], (ret_api) ->
        $('#chat_messages').append '<img src=' + ret_api['image_path'] + ' />'

  speak: (message) ->
    @perform 'speak', message: message

$(document).on 'keypress', '[data-behavior~=speak_chat_messages]', (event) ->
  if event.keyCode is 13
    App.chat_message.speak event.target.value
    event.target.value = ''
    event.preventDefault()
