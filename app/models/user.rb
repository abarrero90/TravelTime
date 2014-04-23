class User < ActiveRecord::Base
  has_secure_password
  has_many :photos
  has_attached_file :avatar, :styles => { :small => '100x100>', :thumb => '100x100>' }, :default_url => '/images/:style/missing.png'
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/


  def self.latest
    User.order(:updated_at).last
  end

  def self.current_user
    session[:user_id] = @current_user.id
    User.find(session[:user_id])
    print 'CURRENT USER ===> ' + String(@current_user.id)
  end



end
