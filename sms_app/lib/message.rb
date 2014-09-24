class Message
  attr_accessor :recipient, :body

  def initialize(recipient, body)
    self.recipient = recipient
    self.body = body
  end
end
