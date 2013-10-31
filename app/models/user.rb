class User < ActiveRecord::Base
  
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  mount_uploader :profile_image, ImageUploader

  has_many :tracks
  has_many :comments

  attr_accessible :name, :username, :email, :profile_image, :password, :password_confirmation, :role, :bio, :css, :is_first_login

  def role?(r)
    self.role == r.to_s
  end


  before_create :set_default_values

  def set_default_values
    if self.role.nil?
      self.role = "user"
    end
    self.is_first_login = true
  end
   
end
 