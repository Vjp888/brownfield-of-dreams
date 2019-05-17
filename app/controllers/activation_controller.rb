class ActivationController < ApplicationController
  def index
    hashids = Hashids.new("saxton hale")
    user_id = hashids.decode(params[:user_id])
    user = User.find(user_id.first)
    user.update(status: true)
  end
end
