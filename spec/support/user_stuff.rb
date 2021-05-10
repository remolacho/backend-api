shared_context 'user_stuff' do
  before(:each) do
    Warden.test_mode!
  end

  after(:each) do
    Warden.test_reset!
  end

  let!(:create_user) {
    User.create!({ firstname: 'usertest',
                   lastname: 'userTest',
                   email: 'usertest@email.com',
                   password: 'passwordtest123',
                   password_confirmation: 'passwordtest123' })
  }

  let(:create_user_2) {
    User.create!({ firstname: 'usertest2',
                   lastname: 'userTest2',
                   email: 'usertest2@email.com',
                   password: 'passwordtest123',
                   password_confirmation: 'passwordtest123' })
  }

  let(:current_user) { User.find_by(email: 'usertest@email.com') }

  let(:current_user_2) { create_user_2 }

  let(:params_user) {
    {
      user: { firstname: 'usertest2',
              lastname: 'userTest2',
              email: 'usertest2@email.com',
              password: 'test123',
              password_confirmation: 'test123'
      }
    }
  }

  let(:'secret-api') { ENV['SECRET_API'] }
end
