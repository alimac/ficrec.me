class Fandom < ApplicationRecord
    validates :name, presence: true

    has_many :collections
    has_many :fanworks
end
