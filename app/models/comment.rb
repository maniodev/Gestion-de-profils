class Comment < ActiveRecord::Base
  belongs_to :profile

  validates :author, presence: true
  validates :content, presence: true
end
