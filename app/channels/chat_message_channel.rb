# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class ChatMessageChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'chat_message_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    Rails.logger.debug data
    Rails.logger.debug cookies.signed[:user_id]
    ChatMessage.create! user_id: data['user_id'], body: data['message']
  end
end
