require './lib/services/sms_deliver'
require 'bunny'

conn = Bunny.new(:automatically_recover => false)
conn.start

ch   = conn.create_channel
q    = ch.queue("sms_app")

begin
  q.subscribe(:block => true) do |delivery_info, properties, body|
    SmsDeliver.new(Marshal.load(body)).call
  end
rescue Interrupt => _
  conn.close

  exit(0)
end
