require 'spec_helper'

feature "how to access a user's profile" do
  before do
    User.create(name: 'Matt', age: 25)
  end

  scenario "displays the user" do
    visit '/users'
    expect(page).to have_content "Matt"
  end

  scenario "takes you to a user's profile upon clicking the link" do
    visit '/users'
    click_link 'Matt'
    expect(page).to have_content 'Matt'
    expect(page).to have_content '25'
  end

  scenario "allows you to go back to the homepage" do
    visit '/users'
    click_link 'Matt'
    click_link 'Back'
    expect(page).to have_link 'Matt'
  end
end

feature "allows you to edit user's profile" do
  before do
    User.create(name: 'Matt', age: 25)
  end

  scenario "gives you an edit form" do
    visit '/users'
    click_link "Matt"
    click_link "Edit"
    expect(page).to have_content "Edit User"
  end

  scenario "changes user's attributes" do
    visit '/users'
    click_link "Matt"
    click_link "Edit"
    fill_in "Name", with: "Vlad"
    fill_in "Age", with: "30"
    click_button "Edit!"
    expect(page).to have_content "Vlad"
  end
end

feature "deleting a user" do
  before do
    User.create(name: 'Matt', age: 25)
    User.create(name: "Vlad", age: 30)
  end

  scenario "displays the delete link for a user" do
    visit '/users'
    click_link "Matt"
    expect(page).to have_content "Delete"
  end

  scenario "deletes a user" do
    visit '/users'
    click_link "Matt"
    click_link "Delete"
    expect(page).to_not have_content "Matt"
    expect(page).to have_content "Vlad"
  end
end

# This is the Rspec underlying of Capybara.
# RSpec   =>   Capybara
# describe => feature
# it => scenario
describe "creation of new user" do
  it "takes us to a form" do
    visit '/users'
    click_link 'Create New User'
    expect(page).to have_content 'Create a new user'
    expect(page).to have_content 'Name'
    expect(page).to have_content 'Age'
    expect(page).to have_button 'Create!'
  end

  it "allows us to submit the new user form" do
    visit '/users'
    click_link "Create New User"
    fill_in "Name", with: "Vlad"
    fill_in "Age", with: "25"
    click_button "Create!"
    expect(page).to have_content "Vlad"
  end
end
