class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  before_action :configure_permitted_parameters

  protected

  def configure_permitted_parameters
    attributes = %i[firstname lastname eamil password password_confirmation]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
  end

  private

  def respond_with(resource, _opts = {})
    success = true
    message = I18n.t('messages.user.register.success')
    status = 200

    unless resource.persisted?
      success = false
      message = resource.errors.full_messages.join(', ')
      status = 401
    end

    resource.add_role :buyer if resource.persisted?

    render json: { success: success, message: message, user: UserSerializer.new(resource) }, status: status
  end
end
