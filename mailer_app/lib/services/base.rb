require 'haml'

module Mailer
  class Base

    def render
      Haml::Engine.new(File.read(template_path)).render(Object.new, locals)
    end

    private
    def locals
      @locals ||= {}
    end

    def template_name
      raise 'Need to be implemented'
    end

    def template_path
      "./templates/#{template_name}.html.haml"
    end
  end
end
