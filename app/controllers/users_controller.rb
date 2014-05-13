class UsersController < ApplicationController
  before_action :authorize, :set_user , only: [:show, :edit, :update, :destroy, :gallery]
  #before_action :set_user, only: [:show, :edit, :update, :destroy]
  include SessionsHelper
  # GET /users
  # GET /users.json

  def index
    @users = User.all
    @photos = Photo.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @comment = Comment.new
    @user = User.all
    @user_comments = Comment.order(:created_at).reverse_order
    print 'ID DEL CURRENT_USER == >' + String(current_user.id)
  end

  def search_users
    search = params[:search]
    print 'This is what we are looking for' + String(search)
    if params[:search]
      @users_result = User.search(params[:search]).order('created_at')
    end
    render :layout => 'search'
  end

  def add_photo
    @photo = Photo.new
    @us_id = params[:id]
    @user_comments = Comment.order(:created_at).reverse_order
    respond_to do |format|
      format.js {render :layout => false}
    end
  end

  # GET /users/new
  def new
    print 'Entering show function'
    @user = User.new
    puts @photos
  end

  # GET /users/1/edit
  def edit
    render layout: false
  end

  def gallery
    @photos = Photo.all
    print 'Galery'
    @user = User.all
    render 'users-gallery'
  end

  def maps
    render 'user-map'
  end


  # POST /users
  # POST /users.json
  def create
    print 'Creando usuario ==> '
    print user_params
    @user = User.create(user_params)
    respond_to do |format|
      if @user.save
        sign_in @user
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if current_user.update(user_params)
        format.html { redirect_to user_path(current_user), notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
    def destroy
      print 'This is the current user that we are going to delete' + String(current_user.id)
      sign_out
      print 'This is the current user that we are deleting' + String(current_user)
      redirect_to home_path
    end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation, :photo, :avatar, :current_user)
    end
end
