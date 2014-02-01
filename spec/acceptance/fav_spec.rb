require 'spec_helper'

feature 'Find the favourite language of the Geek on GitHub', %q{
  As a curious person 
  When I give the geek's GitHub user name
  I would like to know
  The favourite programming language of that geek.
} do

  scenario "Viewing the form" do
    visit "/"
    page.should have_selector("input", type: "text", name: "username") 
    page.should have_selector("label", text: "Geek's GitHub username, please") 
    page.should have_button "Find favourite programming language of that geek"
  end

  scenario "Submitting geek's GitHub username" do
    pending
  end

  scenario "Viewing the favourite programming language" do
    pending
  end
end