# config/initializers/recaptcha.rb
Recaptcha.configure do |config|
  if Rails.env == "development"
    @site_key = '6LcUrhAUAAAAABflpKVBCMIMcLqkbmr5JvqEhvz6'
    @secret_key = '6LcUrhAUAAAAAKwP9HDtN4OBj9mK1iiJT5uY9xJg'
  elsif Rails.env == "production"
    @site_key = '6Lf1rhAUAAAAABDpZziPydwiv5nCo2ice9Mk96W9'
    @secret_key = '6Lf1rhAUAAAAAIN2binspKY6mfPnjp-mRabYjOmP'
  end
  config.site_key  = @site_key
  config.secret_key = @secret_key
end