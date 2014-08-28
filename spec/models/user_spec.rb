require 'spec_helper'
# This is not useful/professional because we don't need to test rails validations. derp.
describe User do
  it 'is valid with a name and age' do
    # Alternative
    # User.create(name: "Steven", age: 50)
    # expect(User.all.count).to eq(1)

    expect{
      User.create(name: "Steven", age: 50)
      }.to change{User.all.count}.from(0).to(1)
  end
  it 'is invalid without name' do
    User.create(age: 50)
    expect(User.all.count).to eq(0)
  end
  it 'is invalid without age' do
    User.create(name: "Steven")
    expect(User.all.count).to eq(0)
  end
  it 'is invalid without name and age' do
    User.create
    expect(User.all.count).to eq(0)
  end
end
