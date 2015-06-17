class MainChatController < ApplicationController
  respond_to :html, :json

  def index
    respond_with Message.last_five_main_chat_messages.to_json
  end
end
