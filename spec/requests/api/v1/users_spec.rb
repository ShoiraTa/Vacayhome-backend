require 'swagger_helper'

RSpec.describe 'api/v1/users', type: :request do
  # rubocop:disable Metrics/BlockLength
  path '/api/v1/users' do
    get('list all users') do
      tags 'Users'
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
    post('create user') do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, required: true, schema: {
        type: :object,
        properties: {
          user: {
            type: :object,
            properties: {
              name: { type: :string },
              email: { type: :string }
            },
            required: %w[name email]
          }
        }
      }
      response(201, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        let(:user) { { name: 'foo', email: 'bar' } }

        run_test!
      end
    end
  end
  path '/api/v1/users/{id}' do
    get 'Retrieves all bookings made by a User' do
      tags 'Users'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string

      response '200', 'user found' do
        let(:id) { User.create(name: 'foo', email: 'bar').id }
        run_test!
      end
    end
  end
end
