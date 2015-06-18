class RockController < ApplicationController
  respond_to :html, :json

  def index
    respond_with Message.last_five_chat_messages("rock")
  end
end
