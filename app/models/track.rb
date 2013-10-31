class Track < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  mount_uploader :track_file, TrackUploader

  attr_accessible :title, :user_id, :track_file

end