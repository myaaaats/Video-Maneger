class Video < ApplicationRecord
  validates :title,    length: { in: 1..20 }
  validates :url,      length: { in: 1..400 }, uniqueness: true
  validates :url,      format: /\A#{URI::regexp(%w(http https))}\z/
  validates :status,   length: { in: 1..11 }
  belongs_to :user
  has_many :comments,  dependent: :destroy
  has_many :favorites, dependent: :destroy
  mount_uploader :image, ImageUploader
end
