# frozen_string_literal: true

class Users::FriendsController < ApplicationController
  def create
    if new_friend
      current_user.friends.create(followed_user_id: new_friend.id)
      flash[:success] = "Successfully added #{params[:login]} as a friend"
    else
      flash[:error] = "#{params[:login]} is not a valid user"
    end
    redirect_to dashboard_path
  end

  private

  def new_friend
    User.find_by(github_name: params[:login])
  end
end
