require 'swagger_helper'

RSpec.describe 'api/v1/bookings', type: :request do
  # rubocop:disable Metrics/BlockLength
  path '/api/v1/bookings' do
    get('list all booking') do
      tags 'Bookings'
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
    post('add a booking') do
      tags 'Bookings'
      consumes 'application/json'
      parameter name: :booking, in: :body, schema: {
        type: :object,
        properties: {
          booking: {
            type: :object,
            properties: {
              user_id: { type: :integer },
              house_id: { type: :integer },
              date: { type: :string, format: :datetime }
            },
            required: %w[user_id house_id date]
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
        run_test!
      end
    end
  end

  path '/api/v1/bookings/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'id'
    delete 'Delete a Booking' do
      tags 'Bookings'
      consumes 'application/json', 'application/xml'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :integer

      response '204', 'Booking deleted' do
        let!(:user) { User.create(name: 'testuser', email: 'test@mail.com') }
        let!(:house) do
          House.create(name: 'test-house', price: 20, description: 'this is test-house', country: 'canada',
                       city: 'toronto', address: 'street 1', property_type: 'apartment', image_url: 'http://image.com')
        end

        let!(:id) { Booking.create(user:, house:).id }

        run_test!
      end
    end

    put('update a booking') do
      tags 'Bookings'
      consumes 'application/json'
      parameter name: :booking, in: :body, schema: {
        type: :object,
        properties: {
          booking: {
            type: :object,
            properties: {
              user_id: { type: :integer },
              house_id: { type: :integer },
              date: { type: :string, format: :datetime }
            },
            required: %w[user_id house_id date]
          }
        }
      }
      response(201, 'successful') do
        let!(:user) { User.create(name: 'testuser', email: 'test@mail.com') }
        let!(:house) do
          House.create(name: 'test-house', price: 20, description: 'this is test-house', country: 'canada',
                       city: 'toronto', address: 'street 1', property_type: 'apartment', image_url: 'http://image.com')
        end

        let!(:id) { Booking.create(user:, house:).id }

        run_test!
      end
    end
  end
end
