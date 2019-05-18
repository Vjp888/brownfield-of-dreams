# frozen_string_literal: true

class UserFacade
  attr_reader :first_name, :last_name, :email, :friends

  def initialize(user)
    @first_name = user.first_name
    @last_name = user.last_name
    @email = user.email
    @token = user.token
    @friends = find_friends(user.friends)
    @status = user.status
  end

  def repos
    service = GithubService.new(token: @token)
    repos = service.get_repos
    repos.map do |repo|
      Repository.new(repo)
    end
  end

  def following
    service = GithubService.new(token: @token)
    users = service.get_following
    users.map do |user|
      GithubUser.new(user)
    end
  end

  def followers
    service = GithubService.new(token: @token)
    users = service.get_followers
    users.map do |user|
      GithubUser.new(user)
    end
  end

  def find_friends(friends)
    friend_list = friends.map(&:followed_user_id)
    User.find(friend_list)
  end

  def token?
    @token.nil?
  end

  def tutorials(user)
    Tutorial.bookmarked_by(user)
  end

  def status
    if @status
      'Active'
    else
      'Inactive'
    end
  end
end
