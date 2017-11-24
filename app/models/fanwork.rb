class Fanwork < ApplicationRecord
  belongs_to :fandom

  has_many :recs
  has_many :collections, :through => :recs
end
