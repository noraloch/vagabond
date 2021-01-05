class Review < ApplicationRecord
    belongs_to :place
    belongs_to :user

    validates :review, presence: true  

    
end
