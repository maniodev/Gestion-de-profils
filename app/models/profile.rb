class Profile < ActiveRecord::Base

  has_many :comments
  mount_uploader :avatar, AvatarUploader


end
