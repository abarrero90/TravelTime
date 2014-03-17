class HomeController < ApplicationController
  def index

  end

  def login
    @user = User.all
    nick = params[:nick]
    user = User.find_by name:  nick
    print "===========>"
    print user.photo
    if user.name and user.authenticate(params[:password])
      @show_show = true
      flash[:notice] = 'Welcome back: ', user.name
      redirect_to user_path(user.id)
    end
  end
end
