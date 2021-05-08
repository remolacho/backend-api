# frozen_string_literal: true

module ManageObjects
  extend ActiveSupport::Concern

  private

  def decoded_token(token)
    token = token.split(' ')[1]
    JWT.decode(token, ENV['JWT_SECRET'], true, { algorithm: 'HS256' })
  rescue JWT::DecodeError
    nil
  end
end
