class Song < ActiveRecord::Base
  belongs_to :album
  belongs_to :artist
  
  validates :name, presence: true, length: { in: 5..50 }
  validates :album_id, :artist_id, presence: true
  scope :latest, -> { order("created_at desc") }
  scope :recent, Proc.new {|arg=0|  arg==0 ? (order("created_at desc").where("created_at > #{(Date.today-6.month)}")) : (order("created_at desc").where("created_at > #{(Date.today-6.month)}").limit(arg)) }


end
