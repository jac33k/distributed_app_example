require './lib/services/base'
require 'mail'

class ConfirmationSend < Mailer::Base

  def initialize(opts = {})
    @options = opts
    locals[:name] = opts.fetch('name')
  end

  def call
    mail.deliver!
  end

  private
  def template_name
    'confirmation'
  end

  def mail
    @mail ||= Mail.new do
      from     'me@test.lindsaar.net'
      subject  'Here is the image you wanted'
      content_type 'text/html; charset=UTF-8'
    end
    @mail.to = @options['email']
    @mail.body = self.render
    @mail
  end
end
