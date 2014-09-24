class InvitationsController < ApplicationController

  def index
  end

  def create
    InvitationSend.new(invitation_params).call
    flash[:notice] = "Invitation has been sent!"
    redirect_to invitations_url
  end

  private
  def invitation_params
    params.permit(:name, :email)
  end
end
