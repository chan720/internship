require "stripe"
Stripe.api_key = Rails.application.credentials[:stripe][:secret]
# Stripe.api_key = "sk_test_51Pw3QsDn7K89fFWQS1VYURcHIA27eqT5fwZfCpRoGLFgfr4IWzaNlvI1rYCsodobWZfWD8b6wvLaNIEgfDgpIPvC00XcmP9ct9"
