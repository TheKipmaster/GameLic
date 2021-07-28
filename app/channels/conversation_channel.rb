class ConversationChannel < ApplicationCable::Channel
  def subscribed
    byebug

    stream_from "conversations-#{current_user.id}"
  end

  def unsubscribed
    byebug

    stop_all_streams
  end

  def speak(data)
    byebug
    
    message_params = data['message'].each_with_object({}) do |el, hash|
      hash[el.values.first] = el.values.last
    end

    ActionCable.server.broadcast(
      "conversations-#{current_user.id}",
      message: message_params
    )
  end
end
