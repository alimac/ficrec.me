class Collection < ApplicationRecord
  belongs_to :fandom
  belongs_to :user

  has_many :recs
  has_many :fanworks, :through => :recs

  validates :title, presence: true, length: { minimum: 2, maximum: 250 }
  validates :user_id, presence: true

end
