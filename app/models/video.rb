class Video < ApplicationRecord
  validates :title,    length: { in: 1..20 }
  validates :url,      length: { in: 1..400 }
  validates :url,      format: /\A#{URI::regexp(%w(http https))}\z/
  validates :url,      :uniqueness => {:scope => [:user_id], message: 'は既に投稿されたものです'}
  validates :url,      format: { with: /google/, message: 'は「https://drive.google.com」を含んだアドレスにしてください'}
  validates :url,      format: { with: /drive/, message: 'は「https://drive.google.com」を含んだアドレスにしてください' }
  validates :status,   length: { in: 1..11 }
  belongs_to :user
  has_many :comments,  dependent: :destroy
  has_many :favorites, dependent: :destroy
  mount_uploader :image, ImageUploader
end
