class User < ActiveRecord::Base
  has_secure_password
  has_many :photos
  has_attached_file :avatar, :styles => { :small => '100x100>', :thumb => '100x100>' }, :default_url => '/images/:style/missing.png'
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  before_create :create_remember_token

  def self.latest
    User.order(:updated_at).last
  end

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end


  private

  def create_remember_token
    self.remember_token = User.digest(User.new_remember_token)
  end

end
