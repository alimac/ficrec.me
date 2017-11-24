class Collection < ApplicationRecord
  belongs_to :fandom

  has_many :recs
  has_many :fanworks, :through => :recs

  validates :title, presence: true,
                    length: { minimum: 2 }

end
