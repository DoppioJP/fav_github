require 'spec_helper'

describe User do
  # http://robots.thoughtbot.com/how-to-stub-external-services-in-tests
  describe "languages" do
    it 'gets the repos from user on GitHub' do
      username = "user_on_github"
      github = Github.new
      repos_list = github.repos.list user: username
      repos_list = repos_list.find_all { |repo| repo.owner.login == username }

      expect(repos_list.first.owner.login).to eql "user_on_github"
    end
    it "gets repos list from GitHub" do
      github = Github.new
      repos_list = github.repos.list user: "user_on_github"

      expect(repos_list.first.language).to eql "Ruby"
    end
    it 'returns empty array if there is nothing to return (no such user or any other problem)' do
      username = "user_not_on_github"
      github = Github.new
      repos_list = github.repos.list user: username
      expect(repos_list.first.owner.login).not_to eql username

      repos_list = repos_list.find_all { |repo| repo.owner.login == username }
      expect(repos_list).to eql []
    end
    it 'counts the languages in repos from GitHub' do
      
    end

    it 'sorts desc the languages based on numbers of repos' do
      
    end

  end
end