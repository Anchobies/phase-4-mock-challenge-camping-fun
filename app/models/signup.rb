class Signup < ApplicationRecord
    belongs_to :camper
    belongs_to :activity

    validates :time, presence: true, numericality: { less_than_or_equal_to: 23, greater_than_or_equal_to: 0 }
end
