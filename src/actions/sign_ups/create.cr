class SignUps::Create < BrowserAction
  include Auth::RedirectSignedInUsers

  post "/sign_up" do
    SignUpUser.create(params) do |operation, user|
      if user
        flash.info = "Thanks for signing up. We've sent you a confirmation email"
        sign_in(user)
        Authentic.redirect_to_originally_requested_path(self, fallback: Home::Index)
      else
        flash.info = "Couldn't sign you up"
        html_with_status NewPage, 418, operation: operation
      end
    end
  end
end
