class ResendEmailConfirmationFlow < BaseFlow
  private getter user
  delegate email, to: user

  def initialize(@user : User)
  end

  def request_email_confirmation
    visit SignUpConfirmationRequests::New
    fill_form RequestSignUpConfirmation,
      email: email
    click "@request-sign-up-confirmation-button"
  end

  def should_have_sent_email_confirmation_email
    user = UserQuery.new.email(email).first
    sleep 0.2
    SignUpConfirmationEmail.new(user).should be_delivered
  end

  def should_have_sent_already_confirmed_email
    user = UserQuery.new.email(email).first
    sleep 0.2
    SignUpAlreadyConfirmedEmail.new(user).should be_delivered
  end
end
