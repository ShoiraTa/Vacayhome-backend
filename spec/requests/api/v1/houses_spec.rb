require 'swagger_helper'

RSpec.describe 'api/v1/houses', type: :request do
  # rubocop:disable Metrics/BlockLength
  path '/api/v1/houses' do
    get('list houses') do
      tags 'Houses'
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

    post('create house') do
      tags 'Houses'
      consumes 'application/json'
      parameter name: :house, in: :body, required: true, schema: {
        type: :object,
        properties: {
          house: {
            type: :object,
            properties: {
              name: { type: :string },
              price: { type: :integer },
              description: { type: :string },
              country: { type: :string },
              city: { type: :string },
              address: { type: :string },
              property_type: { type: :string },
              image_url: { type: :string }
            },
            required: %w[name price description country city address property_type image_url]
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
        let(:house) do
          { name: 'house1', price: 100, description: 'This is house 1', country: 'US', city: 'Los Angeles',
            # rubocop:disable Layout/LineLength
            address: '100 cool street', property_type: 'house', image_url: 'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500' }
        end

        run_test!
      end
    end
  end
  path '/api/v1/houses/{id}' do
    delete 'Delete a house' do
      tags 'Houses'
      consumes 'application/json', 'application/xml'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :integer

      response '204', 'House deleted' do
        let(:id) { 1 }

        run_test!
      end
    end

    patch('update house') do
      response(204, 'successful') do
        tags 'Houses'
        consumes 'application/json'
        parameter name: :id, in: :path, type: :integer
        parameter name: :house, in: :body, schema: {
          type: :object,
          properties: {
            house: {
              type: :object,
              properties: {
                name: { type: :string },
                price: { type: :integer },
                description: { type: :string },
                country: { type: :string },
                city: { type: :string },
                address: { type: :string },
                property_type: { type: :string },
                image_url: { type: :string }
              },
              required: %w[name price description country city address property_type image_url]
            }
          }
        }

        let(:id) do
          House.create(name: 'test-house', price: 20, description: 'this is test-house', country: 'canada', city: 'toronto',
                       address: 'street 1', property_type: 'apartment', image_url: 'http://image.com').id
        end
        let(:house) do
          { name: 'cool-house', price: 100, description: 'this is test-house', country: 'canada', city: 'toronto',
            address: 'street 1', property_type: 'apartment', image_url: 'http://image.com' }
        end

        run_test!
      end
    end

    # patch 'Update a house' do
    #   tags 'Houses'
    #   consumes 'application/json', 'application/xml'
    #   produces 'application/json', 'application/xml'
    #   parameter name: :house, in: :body, required: true, schema: {
    #     type: :object,
    #     properties: {
    #       house: {
    #         type: :object,
    #         properties: {
    #           name: { type: :string },
    #           price: { type: :integer },
    #           description: { type: :string },
    #           country: { type: :string },
    #           city: { type: :string },
    #           address: { type: :string },
    #           property_type: { type: :string },
    #           image_url: { type: :string }
    #         },
    #         required: %w[name price description country city address property_type image_url]
    #       }
    #     }
    #   }

    #   run_test!
    # end
  end
end
