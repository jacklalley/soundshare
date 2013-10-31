class User < ActiveRecord::Base
  
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  mount_uploader :profile_image, ImageUploader

  has_many :tracks
  has_many :comments

  attr_accessible :name, :username, :email, :profile_image, :password, :password_confirmation, :role, :bio, :css

  def role?(r)
    self.role == r.to_s
  end


  before_create :set_default_role_if_empty

  def set_default_role_if_empty
    if self.role.nil?
      self.role = "user"
    end
  end
   
end
 