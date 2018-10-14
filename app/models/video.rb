class Video < ApplicationRecord
  validates :title,    length: { in: 1..20 }
  validates :url,      length: { in: 1..400 }
  validates :status,   length: { in: 1..11 }
end
