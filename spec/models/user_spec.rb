require 'spec_helper'

describe User do
  it 'is valid with a name and age' do
    # Alternative
    # User.create(name: "Steven", age: 50)
    # expect(User.all.count).to eq(1)

    expect{
      User.create(name: "Steven", age: 50)
      }
      .to change{User.all.count}.from(0).to(1)
  end
  it 'is invalid without name' do

  end
  it 'is invalid without age' do
  end
  it 'is invalid without name and age' do
  end
end
