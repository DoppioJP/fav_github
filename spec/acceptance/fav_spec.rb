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

  context "That favourite programming language for existing GitHub user" do
    background  do
      visit "/"
      fill_in :username, with: "user_on_github"
      click_button "Find favourite programming language of that geek"
    end
    scenario "Submitting geek's GitHub username" do
      current_path.should eql fav_path
      current_url.should include("username=user_on_github")
    end

    scenario "Viewing the favourite programming language" do
      page.should have_content "Ruby: 21"
    end

    scenario "Viewing the favourit programming language should be nice" do
      page.should have_selector("h1", text: "user_on_github")
      page.should have_selector("ol li", text: "Ruby: 21")
    end

    scenario "When language is not specified, put the [unknown] instead" do
      page.should have_content "[unknown]"
    end

  end
  
  scenario "When no result, explain why" do
    visit "/"
    fill_in :username, with: "user_not_on_github"
    click_button "Find favourite programming language of that geek"
    
    page.should have_selector("h1", text: "user_not_on_github")
    page.should_not have_selector("ol")
    page.should have_content "Well, that geek might not have any repos on GitHub, hence one's favourite language is unknown, you know?"
  end
end