class Song < ActiveRecord::Base
  belongs_to :album
  belongs_to :artist
  
  validates :name, presence: true, length: { in: 5..50 }
  validates :album_id, :artist_id, presence: true
  scope :latest, -> { order("created_at desc") }


end
