class ApplicationMailer < ActionMailer::Base
  default from: "tennis-club-partner@yopmail.com"
  layout "mailer"

  ERRORS_TO_RESCUE = [
    Net::SMTPAuthenticationError,
    Net::SMTPServerBusy,
    Net::SMTPSyntaxError,
    Net::SMTPFatalError,
    Net::SMTPUnknownError,
    Errno::ECONNREFUSED
  ]

  rescue_from *ERRORS_TO_RESCUE do |exception|
    # Handle it here
    Rails.logger.error("failed to send email")
  end
end
