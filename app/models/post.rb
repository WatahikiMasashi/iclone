class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user , optional:true
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  validates :content, presence: true,length: { in: 1..140}
end
