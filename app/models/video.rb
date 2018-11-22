class Video < ApplicationRecord
  validates :title,    length: { in: 1..20 }
  validates :url,      length: { in: 1..400 }
  validates :url,      format: /\A#{URI::regexp(%w(http https))}\z/
  validates :url,      :uniqueness => {:scope => :user_id},  acceptance: { message: 'は既に投稿されたものです' }
  validates :status,   length: { in: 1..11 }
  belongs_to :user
  has_many :comments,  dependent: :destroy
  has_many :favorites, dependent: :destroy
  mount_uploader :image, ImageUploader
end
