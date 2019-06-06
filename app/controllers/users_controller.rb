class UsersController < ApplicationController
  def show
    if params[:id]
      @user = User.find(params[:id])
    else
      @user = current_user
    end
  end

  def index
    @users = User.all
    @top_users = @users.sort_by {|user| user.score }.last(3).reverse
    @last_users = @users.sort_by {|user| user.score }.first(4).reverse
  end
end
