class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_secure_password
  has_many :photos
  has_attached_file :avatar, :styles => { :small => '100x100>', :thumb => '100x100>' }, :default_url => '/images/:style/missing.png'
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def self.latest
    User.order(:updated_at).last
  end

  def current_user
    @current_user ||= User.find(session[:user_id])
  end

end
