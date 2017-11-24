class Fandom < ApplicationRecord
    has_many :collections

    has_many :fanworks
end
