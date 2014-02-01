class User
  def initialize(username)
    @username = username
  end
  
  def on_github?
    github = Github.new
    true
  end
  
  def languages
    github = Github.new
    repos_list = github.repos.list user: @username
    repos_list.group_by(&:language)
    repos_list.group_by(&:language).collect { |lang, repos| { lang: lang, count: repos.size } }
  end
end