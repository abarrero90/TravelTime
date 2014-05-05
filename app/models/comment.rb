class Comment < ActiveRecord::Base

  def self.latest
    Comment.order(:updated_at).last
  end

end
