# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
    user_name: 'apikey',
    password: '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',
    domain: 'localhost:3000',
    address: 'smtp.sendgrid.net',
    port: 587,
    authentication: :plain,
    enable_starttls_auto: true
  }