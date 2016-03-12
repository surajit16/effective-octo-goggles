class Album < ActiveRecord::Base
  belongs_to :publisher
  has_many :songs, dependent: :destroy
  
  validates :name, presence: true, length: { in: 2..50 }
  validates :publisher_id, presence: true
  validates :cover_art, presence: true
  validates :released_on, presence: true, format: { with: /\A\d{4}-\d{2}-\d{2}\z/, message: "should be in the format YYYY-MM-DD" }
end
