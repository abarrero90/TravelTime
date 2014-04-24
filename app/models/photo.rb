class Photo < ActiveRecord::Base
  belongs_to :user
  has_attached_file :avatar, :styles => { :small => '100x100>', :thumb => '100x100>' }, :default_url => '/images/:style/missing.png'
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
   include SessionsHelper
  def self.latest
    Photo.order(:updated_at).last
  end

end
