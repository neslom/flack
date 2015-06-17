class MessagesController < ApplicationController
  respond_to :json

  def create
    message = Message.create!(body: params["message"]["body"], channel: params["message"]["channel"], user_id: current_user.id)

    message_response = { message: message, user: current_user.name }

    respond_with(message_response, status: 200, location: "")

    $redis.publish("#{message.channel}", message_response.to_json)
  end
end
