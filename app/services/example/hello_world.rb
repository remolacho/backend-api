module Example
  class HelloWorld < BaseService
    def initialize(user: nil)
      super(user: user)
    end

    def call
      { success: true, user: user, roles: user.roles, message: I18n.t('messages.example.hello') }
    end
  end
end
