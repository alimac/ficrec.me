class Collection < ApplicationRecord
  belongs_to :fandom

  validates :title, presence: true,
                    length: { minimum: 2 }

end
