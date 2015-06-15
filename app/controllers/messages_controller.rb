class MessagesController < ApplicationController
  respond_to :json

  def create
    message = Message.create!(body: params["message"]["body"], channel: params["message"]["channel"], user_id: current_user.id)

    respond_with({ message: message, user: current_user.name }, status: 200, location: "")

    # $redis.publish("channel") do
    #
    # end
  end
end
