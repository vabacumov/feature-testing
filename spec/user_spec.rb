require 'spec_helper'

describe "the root view" do
  before do
    User.create(name: 'Matt', age: 25)
  end

  it "displays the user" do
    visit '/users'
    expect(page).to have_content "Matt"
  end

  it "takes you to a user's profile upon clicking the link" do
    visit '/users'
    click_link 'Matt'
    expect(page).to have_content 'Matt'
    expect(page).to have_content '25'
  end
end
