# config/initializers/stripe.rb
Stripe.api_key = ENV['STRIPE_SECRET_KEY']

STRIPE_SUPPORTED_COUNTRIES = ["AU", "AT", "BE", "BG", "CA", "CY", "CZ", "DK", "EE", "FI", "FR", "DE", "GR", "HK", "HU", "IE", "IT", "JP", "LV", "LT", "LU", "MT", "NL", "NZ", "NO", "PL", "PT", "RO", "SG", "SK", "SI", "ES", "SE", "CH", "GB", "US"].freeze
#Constant array .freeze to make it static and improve optimization