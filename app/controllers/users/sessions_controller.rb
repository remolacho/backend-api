class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    render json: { success: true,
                   message: I18n.t('login.success.message'),
                   user: UserSerializer.new(resource) },
           status: 200
  end

  def respond_to_on_destroy
    head :ok
  end
end
