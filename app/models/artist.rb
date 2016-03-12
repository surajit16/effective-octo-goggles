class Artist < ActiveRecord::Base
  has_many :songs, dependent: :destroy
  has_many :albums, through: :songs, dependent: :destroy
  
  validates :name, presence: true
end
