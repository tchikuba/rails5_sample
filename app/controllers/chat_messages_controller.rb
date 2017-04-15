class ChatMessagesController < ApplicationController
  def index
    if current_user.blank?
      session[:callback] = chat_messages_index_path
      return redirect_to login_path
    end
    @chat_messages = ChatMessage.all
  end
end
