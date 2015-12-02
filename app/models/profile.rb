class Profile < ActiveRecord::Base

  has_many :comments
  validates :nom, presence: true
  validates :prenom, presence: true
  validates :dob, presence: true
  validates :address, presence: true
  validates :about, presence: true

  mount_uploader :avatar, AvatarUploader


  max_paginates_per 10

end
