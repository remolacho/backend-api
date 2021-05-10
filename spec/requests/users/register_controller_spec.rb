require 'swagger_helper'

RSpec.describe Users::RegistrationsController, type: :request do
  include_context 'user_stuff'

  describe 'Retorna data del user' do
    path "/signup" do
      post 'Registra el nuevo usuario' do
        tags 'Backend Users'
        description 'retorna los datos usuario y en el header el JWT response.header["Authorization"]'
        consumes 'application/json'
        produces 'application/json'
        parameter name: 'secret-api', in: :header, required: true
        parameter name: :user_register, in: :body, schema: {
          type: :object,
          properties: {
            user: {
              type: :object,
              properties: {
                email: { type: :string },
                password: { type: :string },
                firstname: { type: :string },
                lastname: { type: :string },
                password_confirmation: { type: :string }
              }
            }
          },
          required: ['firstname', 'email', 'password', 'password_confirmation']
        }
        response 200, 'success!!!' do
          schema type: :object,
                 properties: {
                   success: { type: :boolean },
                   message: { type: :string },
                   user: { type: :object,
                           properties: {
                             id: { type: :integer },
                             email: { type: :string },
                             firstname: { type: :string },
                             lastname: { type: :string }
                           } }
                 }

          let(:user_register) {
            params_user
          }

          run_test! do |response|
            body = JSON.parse(response.body)
            expect(body.dig('success')).to eq(true)
            expect(response.header['Authorization'].present?).to eq(true)
          end
        end

        response 401, 'error se validan datos!!!' do
          schema type: :object,
                 properties: {
                   success: { type: :boolean, default: false },
                   message: { type: :string },
                   user: { type: :object,
                           properties: {
                             id: { type: :integer, nullable: true },
                             email: { type: :string },
                             firstname: { type: :string },
                             lastname: { type: :string }
                           } }
                 }

          let(:user_register) {
            params = params_user
            params[:user][:email] = ''
            params
          }

          run_test! do |response|
            body = JSON.parse(response.body)
            expect(body.dig('success')).to eq(false)
            expect(response.header['Authorization'].present?).to eq(false)
          end
        end
      end
    end
  end
end
