class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]


  # GET /photos
  # GET /photos.json
  def index
    @photos = Photo.all
    @user = User.all
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
  end


  # GET /photos/new
  def new
    @photo = Photo.new
    user_id = User.find(params[:user_id])
    print 'ESTE ES EL USUARIO' + String(user_id.id)
  end

  # GET /photos/1/edit
  def edit
  end

   def add_photo
    user = User.find(params[:id])
    print 'User that is saving a new photo ==> '
    print user.id
    # Render the view of the form in order to add a new photo.
    render  'new'
   end

  # POST /photos
  # POST /photos.json
  def create
    @user = session[:user_id]
    print 'PARAMETROS =======>     '
    print @user
    #print 'ESTE ES EL USUARIO' + String(@add_photo_user_id.id)
    #@photo = Photo.create(photo_params, user_id: @user.id)
    #@photo = user.photos.create(photo_params)
    @photo = Photo.create(order_date: Time.now, customer_id: @user.id)
    print 'ID of the user that already saved the photo: ' + String(@user.id)


    respond_to do |format|
      if @photo.save
        format.html { redirect_to @photo, notice: 'Photo was successfully created.' }
        format.json { render action: 'show', status: :created, location: @photo }
      else
        format.html { render action: 'new' }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to photos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:title, :url, :avatar, :user_id, :id)
    end
end
