class InvitationSend

  def initialize(opts = {})
    @options = opts.to_hash
  end

  def call
    conn.start

    channel.default_exchange.publish(Marshal.dump(@options), routing_key: queue.name)

    conn.close
  end

  private
  def conn
    @conn ||= Bunny.new(automatically_recover: false)
  end

  def channel
    @channel ||= conn.create_channel
  end

  def queue
    @queue ||= channel.queue("mailer_app")
  end
end
