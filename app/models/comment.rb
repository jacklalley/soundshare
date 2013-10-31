class Comment < ActiveRecord::Base
  belongs_to :track
  belongs_to :user

  attr_accessible :text, :track_id

end