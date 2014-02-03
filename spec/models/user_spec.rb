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

    it 'returns an Array' do
      user = User.new("user_on_github")
      expect(user.languages).to be_an_instance_of(Array)
    end

    it 'counts the languages in repos from GitHub' do
      user = User.new("user_on_github")
      expect(user.languages).to include({ lang: "Ruby",       count: 21 })
      expect(user.languages).to include({ lang: "Python",     count: 1  })
      expect(user.languages).to include({ lang: "JavaScript", count: 3  })
    end

    it 'sorts desc the languages based on numbers of repos' do
      user = User.new("user_on_github")
      expect(user.languages.first).to  eql({ lang: "Ruby",       count: 21 })
      expect(user.languages.second).to eql({ lang: nil,          count: 5  })
      expect(user.languages[2]).to     eql({ lang: "JavaScript", count: 3  })
    end

  end
end