class User
  def initialize(username)
    @username = username
  end

  def languages
    github = Github.new
    begin
      repos_list = github.repos.list user: @username
      repos_list = repos_list.find_all { |repo| repo.owner.login == @username }
      repos_list.group_by(&:language).collect { |lang, repos| { lang: lang, count: repos.size } }.sort { |a, b| a[:count] <=> b[:count] }.reverse
    rescue
      []
    end
  end
end