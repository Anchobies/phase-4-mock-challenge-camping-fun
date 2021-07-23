class Camper < ApplicationRecord
    has_many :signups
    has_many :activities, through: :signups

    validates :name, presence: true
    validates :age, presence: true, numericality: { less_than_or_equal_to: 18, greater_than_or_equal_to: 8 }
end
