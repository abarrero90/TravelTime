class SessionsController < ApplicationController
  layout 'session-layout.html.erb'

  def authorize
    print 'Before nothing we ha9ve to set the logout function'
    if current_user.nil?
      redirect_to home_path
    else
      redirect_to user_path(current_user.id)
    end
  end


  def home
    @user = User.new
    render 'home'
  end

  def index
    render 'potada'
  end

  def sign_up
    render 'sign_up'
  end

  def create
    print 'ENTRANDO EN'
    user = User.find_by(name: params[:session][:name].downcase)
    if user && user.authenticate(params[:session][:password])
      # Sign the user in and redirect to the user's show page.
      #print 'Current User' + String(current_user)
      sign_in user
      redirect_to user_path(current_user)
    else
      # Create an error message and re-render the signin form.
      flash[:notice] = 'Invalid email/password combination' # Not quite right!
      redirect_to home_path
    end
  end

  def destroy
    #sign_out
    #redirect_to root_url
  end

end
