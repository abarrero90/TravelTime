class SessionsController < ApplicationController


  def new
    render 'new'
  end

  def create
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
