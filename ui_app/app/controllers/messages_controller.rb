class MessagesController < ApplicationController

  def show
    render 'index'
  end

  def create
    SmsSend.new(message_params).call
    flash[:notice] = "Message has been sent!"
    redirect_to messages_url
  end

  private
  def message_params
    params.permit(:recipient, :body)
  end
end
