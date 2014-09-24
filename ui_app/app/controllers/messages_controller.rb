class MessagesController < ApplicationController

  def show
    render 'index'
  end

  def create
    SmsSend.new(message_params).call
    redirect_to messages_url
  end

  private
  def message_params
    params.permit(:recipient, :body)
  end
end
