RSpec.describe User, type: :model do
  subject do
    User.new(name: 'Test User', email: 'test@test.com')
  end
  before { subject.save }

  it 'name should not be nil' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should valid the name' do
    subject.name = 'Test User'
    expect(subject).to be_valid
  end

  it 'should valid the email' do
    subject.email = 'test@test.com'
    expect(subject).to be_valid
  end

  it 'should be invalid email' do
    subject.email = ''
    expect(subject).to_not be_valid
  end
end
