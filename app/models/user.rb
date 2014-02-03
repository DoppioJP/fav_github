class User
  def initialize(username)
    @username = username
  end

  def languages
    github = Github.new
    begin
      repos_list = github.repos.list user: @username
      repos_list.group_by(&:language).collect { |lang, repos| { lang: lang, count: repos.size } }
    rescue
      []
    end
  end
end