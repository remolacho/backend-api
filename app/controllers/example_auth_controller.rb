class ExampleAuthController < ApplicationController
  def index
    service = Example::HelloWorld.new(user: current_user)
    render json: service.call
  end
end
