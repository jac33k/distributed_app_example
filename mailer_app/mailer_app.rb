require './lib/services/confirmation_send'
require './config/letter_opener'

require 'bunny'

conn = Bunny.new(:automatically_recover => false)
conn.start

ch   = conn.create_channel
q    = ch.queue("mailer_app")

begin
  q.subscribe(:block => true) do |delivery_info, properties, body|
    ConfirmationSend.new(Marshal.load(body)).call
  end
rescue Interrupt => _
  conn.close

  exit(0)
end
