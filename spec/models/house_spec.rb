require 'rails_helper'

RSpec.describe House, type: :model do
  subject do
    House.new(name: 'test house', price: 100, description: 'This is test house', country: 'US', city: 'Los Angeles',
              address: '100 cool street', property_type: 'house', image_url: 'https://test.com/img1')
  end
  before { subject.save }

  it 'name should not be nil' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should valid the name' do
    subject.name = 'test house'
    expect(subject).to be_valid
  end

  it 'price should be a number' do
    expect(subject).to be_valid
  end

  it 'image_url should be a link' do
    expect(subject.image_url).to match('http')
  end
end
