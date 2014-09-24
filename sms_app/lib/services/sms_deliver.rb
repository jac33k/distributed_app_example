require './lib/message'
require 'logger'

class SmsDeliver

  def initialize(opts = {})
    @options = opts
    @message = Message.new(@options.fetch(:recipient), @options.fetch(:body))
  end

  def call
    logger.info('Message sent') { "{ recipient: #{@message.recipient}, body: #{@message.body} }" }
  end

  private
  def logger
    @logger ||= Logger.new('logs/development.log')
  end
end
