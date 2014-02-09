class AuthController < Devise::OmniauthCallbacksController
  # TODO: this overrides the Devise Controller set_flash_message method, which seems to expect
  # the controller to be named differently.  Investigate why this is so.
  def set_flash_message(flash_key, message_key, options = {})
    message = I18n.t("#{message_key}", options)
    flash[flash_key] = message if message.present?
  end
  
  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, 'devise.omniauth_callbacks.success', :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end
