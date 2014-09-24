class InvitationSend < Base

  private

  def queue_name
    "mailer_app"
  end
end
