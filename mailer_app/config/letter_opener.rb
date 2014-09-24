require "letter_opener"

Mail.defaults do
  delivery_method LetterOpener::DeliveryMethod, :location => File.expand_path('/tmp/letter_opener', __FILE__)
end
