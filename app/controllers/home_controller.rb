class HomeController < ApplicationController
  def index

  end

  def login
    @user = User.all
    @current_user = User.all
    nick = params[:nick]
    user = User.find_by name:  nick
    if user.name and user.authenticate(params[:password])
      @show_show = true
      @current_user = user.id
      flash[:notice] = 'Welcome back: ', user.name
      redirect_to user_path(user.id)
    end
  end
end
