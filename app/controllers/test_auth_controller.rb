class TestAuthController < ApplicationController
  def index
    render json: {success: true, user: current_user, roles: current_user.roles}
  end
end
