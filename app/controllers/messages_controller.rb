class MessagesController < ApplicationController
  respond_to :json

  def create
    message = Message.create!(body: params["message"]["body"], channel: params["message"]["channel"], user_id: current_user.id)

    message_response = { message: message, user: current_user.name }

    respond_with(message.custom_json(current_user), status: 200, location: "")

    $redis.publish("#{message.channel}", message.custom_json(current_user))
  end
end
