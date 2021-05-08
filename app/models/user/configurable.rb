class User
  module Configurable
    extend ActiveSupport::Concern

    def jwt_payload
      { id: id, email: email, full_name: full_name, roles: roles.map(&:name) }
    end

    def jwt_exp
      { sub: id, scp: 'user', aud: nil, iat: Time.now.to_i, exp: (Time.now + 1.day).to_i, jti: create_jti }
    end

    def on_jwt_dispatch(_token, _payload)
      JwtBlacklist.where('exp < ?', Date.today).destroy_all
    end

    def full_name
      "#{firstname.try(:titleize)} #{lastname.try(:titleize)}"
    end

    private

    def create_jti
      Digest::MD5.hexdigest("St3pBySt3p12020Et1n3R#{Time.now.strftime('%d%m%Y%H%M%S')}")
    end
  end
end
