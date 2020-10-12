class Fuku < ApplicationRecord
    attachment :image
    belongs_to :user
    has_many :likes

    validates :title, presence: true
    validates :body, presence: true
    validates :image, presence: true
end
