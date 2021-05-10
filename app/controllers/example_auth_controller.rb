class ExampleAuthController < ApplicationController
  def index
    service = Example::HelloWorld.new(user: current_use)
    render json: service.call
  end
end
