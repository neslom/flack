class MainChatController < ApplicationController
  respond_to :html, :json

  def index
    respond_with Message.last_five_chat_messages("main")
  end
end
