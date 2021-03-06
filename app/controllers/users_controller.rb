class UsersController < ApplicationController
  before_action :authorize, :set_user , only: [:show, :edit, :update, :destroy]
  #before_action :set_user, only: [:show, :edit, :update, :destroy]
  include SessionsHelper
  layout 'user-layout.html.erb'
  # GET /users
  # GET /users.json

  def index
    @users = User.all
    @photos = Photo.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @photos = Photo.all
    @comment = Comment.new
    @user_comments = Comment.order(:created_at).reverse_order

    print 'ID DEL CURRENT_USER == >' + String(current_user.id)
  end



  def add_photo
    @photo = Photo.new
    @us_id = params[:id]
    render 'add_photo'
  end

  # GET /users/new
  def new
    print 'Entering show function'
    @user = User.new
    puts @photos
  end

  # GET /users/1/edit
  def edit
  end

  def gallery
    print 'GALERIAAAAAA'
    @user = User.all
    respond_to do |format|
        format.html { redirect_to user_path(current_user.id) }
        format.js {}
        format.json { render action: 'show', status: :created, location: @comment }
    end
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
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
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
