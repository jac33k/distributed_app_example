class SmsSend < Base

  private

  def queue_name
    "sms_app"
  end
end
